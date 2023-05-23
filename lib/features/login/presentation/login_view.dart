import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plan_n_track/features/login/domain/i_login_repository.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late bool isRegister;

  @override
  void initState() {
    isRegister = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    // final _logInRepository = GetIt.I.get<ILoginRepository>();

    return Scaffold(
      body: Container(
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
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Lapsus Calami',
                textAlign: TextAlign.center,
                style: GoogleFonts.pacifico(
                  color: theme.primary,
                  fontSize: 36,
                ),
              ),
            ),
            const SizedBox(height: 70),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            if (isRegister)
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Reenter Password',
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // _logInRepository.registerWithEmail('', '');
              },
              child: const Text('Sign In'),
            ),
            const SizedBox(
              height: 24,
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  isRegister = !isRegister;
                });
              },
              child: Text(isRegister ? 'Login Instead' : 'Register Instead'),
            )
          ],
        ),
      ),
    );
  }
}
