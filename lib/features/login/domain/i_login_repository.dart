import 'dart:async';

abstract class ILoginRepository {
  FutureOr<bool> registerWithEmail(String email, String password);
  FutureOr<bool> login(String email, String password);
  FutureOr<void> logout();
  FutureOr<bool> tryLogin();
}
