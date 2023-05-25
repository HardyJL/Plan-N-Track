import 'package:go_router/go_router.dart';
import 'package:plan_n_track/features/login/presentation/login_page.dart';
import 'package:plan_n_track/features/tracking/presentation/tracking_view.dart';
import 'package:plan_n_track/router/app_route.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: AppRoute.overview.routeName,
      path: AppRoute.overview.routePath,
      builder: (ctx, _) => const TrackingView(),
    ),
    GoRoute(
      name: AppRoute.login.routeName,
      path: AppRoute.login.routePath,
      builder: (ctx, _) => const LoginPage(),
    ),
  ],
);
