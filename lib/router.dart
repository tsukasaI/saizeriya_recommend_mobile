import 'package:go_router/go_router.dart';
import './views/recommend.dart';
import './views/menu.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: Recommend.routerName,
      builder: (context, state) => const Recommend(),
    ),
    GoRoute(
      path: Menu.routerName,
      builder: (context, state) => const Menu(),
    ),
  ],
);
