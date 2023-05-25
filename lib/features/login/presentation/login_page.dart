import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plan_n_track/features/login/presentation/bloc/login_bloc.dart';
import 'package:plan_n_track/features/login/presentation/login_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc()..add(LoginPageInitialized()),
      child: const LoginView(),
    );
  }
}
