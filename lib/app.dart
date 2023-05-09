import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import './views/recommend.dart';
import './views/menu.dart';

final _router = GoRouter(
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
