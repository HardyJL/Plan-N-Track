import 'dart:async';
import 'dart:developer';
import 'package:encrypt/encrypt.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:plan_n_track/features/login/domain/i_login_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository implements ILoginRepository {
  final emailString = 'email';
  final passwordString = 'passw';

  String decryptWithAES(String key, Encrypted encryptedData) {
    var encryptKey = key;
    if (encryptKey.length < 16) {
      encryptKey = key + key;
    }
    final cipherKey = Key.fromUtf8(encryptKey);
    final encryptService = Encrypter(AES(cipherKey, mode: AESMode.cbc));
    final initVector = IV.fromUtf8(encryptKey.substring(0, 16));
    return encryptService.decrypt(encryptedData, iv: initVector);
  }

  Encrypted encryptWithAES(String key, String plainText) {
    var encryptKey = key;
    if (encryptKey.length < 16) {
      encryptKey = key + key;
    }
    final cipherKey = Key.fromUtf8(encryptKey);
    final encryptService = Encrypter(AES(cipherKey, mode: AESMode.cbc));
    final initVector = IV.fromUtf8(encryptKey.substring(0, 16));
    final encryptedData = encryptService.encrypt(plainText, iv: initVector);
    return encryptedData;
  }

  Future<void> setStorage(String email, String password) async {
    final sharedPrefs = GetIt.I.get<SharedPreferences>();
    final encrypted = encryptWithAES(email, password).base64;
    await sharedPrefs.setString(emailString, email);
    await sharedPrefs.setString(passwordString, encrypted);
  }

  Future<void> removeFromStorage() async {
    final sharedPrefs = GetIt.I.get<SharedPreferences>();
    await sharedPrefs.remove(emailString);
    await sharedPrefs.remove(passwordString);
  }

  @override
  FutureOr<bool> login(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await setStorage(email, password);
      return true;
    } on FirebaseAuthException catch (ex) {
      log(ex.message ?? 'An error ocurred');
    }
    return false;
  }

  @override
  FutureOr<void> logout() async {
    await FirebaseAuth.instance.signOut();
    await removeFromStorage();
  }

  @override
  FutureOr<bool> tryLogin() {
    final sharedPrefs = GetIt.I.get<SharedPreferences>();
    final email = sharedPrefs.get(emailString);
    final password = sharedPrefs.get(passwordString);
    if (email != null &&
        password != null &&
        email is String &&
        password is String) {
      return login(email, decryptWithAES(email, Encrypted.from64(password)));
    }

    return false;
  }

  @override
  FutureOr<bool> registerWithEmail(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await setStorage(email, password);
      return true;
    } on FirebaseAuthException catch (ex) {
      log(ex.message ?? 'An error ocurred');
    }
    return false;
  }
}
