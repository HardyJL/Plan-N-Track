import 'dart:async';

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
  FutureOr<void> registerWithEmail(String email, String password) {
    // TODO: implement registerWithEmail
    throw UnimplementedError();
  }
}
