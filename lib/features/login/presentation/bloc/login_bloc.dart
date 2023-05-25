import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:plan_n_track/features/login/domain/i_login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginPageInitialized>(_onLoginPageInitialized);
    on<LoginModeChanged>(_onLoginModeChanged);
    on<LoginTriggered>(_onLoginTriggered);
  }

  bool isRegister = false;
  final loginRepository = GetIt.I.get<ILoginRepository>();

  FutureOr<void> _onLoginPageInitialized(
    LoginPageInitialized event,
    Emitter<LoginState> emit,
  ) {
    emit(LoginLoading());
    // do the magic
    emit(LoginInitial());
  }

  FutureOr<void> _onLoginModeChanged(
    LoginModeChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(LoginLoading());
    isRegister = !isRegister;
    emit(LoginInitial());
  }

  FutureOr<void> _onLoginTriggered(
    LoginTriggered event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    late bool result;

    if (isRegister) {
      result =
          await loginRepository.registerWithEmail(event.email, event.password);
    } else {
      result = await loginRepository.login(event.email, event.password);
    }
    log(result.toString());
    emit(result ? LoginSuccessfull() : LoginFailed());
  }
}
