import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:plan_n_track/features/login/domain/i_login_repository.dart';

class LoginRepository implements ILoginRepository {
  @override
  FutureOr<bool> login(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (ex) {
      log(ex.message ?? 'An error ocurred');
    }
    return false;
  }

  @override
  FutureOr<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  FutureOr<bool> registerWithEmail(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (ex) {
      log(ex.message ?? 'An error ocurred');
    }
    return false;
  }
}
