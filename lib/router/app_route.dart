enum AppRoute {
  login('/', 'login'),
  overview('/overview', 'overview');

  const AppRoute(this.routePath, this.routeName);

  final String routePath;
  final String routeName;
}
