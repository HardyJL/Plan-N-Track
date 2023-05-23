import 'package:firebase_core/firebase_core.dart';
import 'package:plan_n_track/app.dart';
import 'package:plan_n_track/bootstrap.dart';

import 'package:plan_n_track/firebase_options.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await bootstrap(() => const App());
}
