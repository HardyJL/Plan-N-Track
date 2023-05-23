import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:plan_n_track/features/login/data/login_repository.dart';
import 'package:plan_n_track/features/login/domain/i_login_repository.dart';

Future<void> initializeDependencyInjection() async {
  // ignore: avoid_single_cascade_in_expression_statements
  GetIt.I
    // Register dio
    ..registerSingleton<Dio>(Dio())
    ..registerFactory<ILoginRepository>(LoginRepository.new);

  // // Register Auth Service
  // ..registerLazySingleton<NavigationBloc>(
  //   NavigationBloc.new,
  // );
}
