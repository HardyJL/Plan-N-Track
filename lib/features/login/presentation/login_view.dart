import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:plan_n_track/features/login/domain/i_login_repository.dart';
import 'package:plan_n_track/features/login/presentation/bloc/login_bloc.dart';
import 'package:plan_n_track/router/app_route.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmationController;
  late TextEditingController emailController;

  @override
  void initState() {
    passwordController = TextEditingController();
    passwordConfirmationController = TextEditingController();
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    passwordConfirmationController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessfull) {
            context.goNamed(AppRoute.overview.routeName);
          } else if (state is LoginFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Something went wrong')),
            );
          }
        },
        builder: (context, state) {
          if (state is LoginLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          final bloc = context.read<LoginBloc>();
          return Container(
            decoration: kIsWeb
                ? BoxDecoration(
                    border: Border.all(
                      color: theme.outline,
                    ),
                  )
                : null,
            padding: const EdgeInsets.all(20),
            margin: kIsWeb
                ? EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 3.5,
                    vertical: 24,
                  )
                : null,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SvgPicture.asset(
                  'assets/images/logo.svg',
                  height: 100,
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) => value != null && !value.contains('@')
                      ? 'Please Enter a valid email address'
                      : null,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  validator: (value) => value != null && value.length < 5
                      ? 'Please Enter a longer password'
                      : null,
                ),
                const SizedBox(height: 20),
                if (bloc.isRegister)
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: passwordConfirmationController,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                    validator: (value) {
                      return (value != null &&
                              value.length < 5 &&
                              value != passwordController.value.text)
                          ? 'Please reenter the same password'
                          : null;
                    },
                  ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    bloc.add(
                      LoginTriggered(
                        emailController.value.text,
                        passwordController.value.text,
                      ),
                    );
                  },
                  child: const Text('Sign In'),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextButton(
                  onPressed: () {
                    bloc.add(LoginModeChanged());
                  },
                  child: Text(
                    bloc.isRegister ? 'Login Instead' : 'Register Instead',
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
