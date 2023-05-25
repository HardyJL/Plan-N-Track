part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginPageInitialized extends LoginEvent {}

class LoginModeChanged extends LoginEvent {}

class LoginTriggered extends LoginEvent {
  LoginTriggered(this.email, this.password);

  final String email;
  final String password;
}
