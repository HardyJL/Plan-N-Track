import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:plan_n_track/features/login/domain/i_login_repository.dart';

class LoginRepository implements ILoginRepository {
  @override
  FutureOr<void> login(String email, String password) {
    // TODO: implement login
  }

  @override
  FutureOr<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  FutureOr<void> registerWithEmail(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (ex) {
      log(ex.message ?? 'An error ocurred');
    }
  }
}
