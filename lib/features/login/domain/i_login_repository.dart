import 'dart:async';

abstract class ILoginRepository {
  FutureOr<void> registerWithEmail(String email, String password);
  FutureOr<void> login(String email, String password);
  FutureOr<void> logout();
}
