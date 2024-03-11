import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jpsf_msc/screens/a_star_screen/a_star_screen.dart';
import 'package:jpsf_msc/screens/home_screen/home_screen.dart';

final router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'a-star',
          name: 'a-star',
          builder: (BuildContext context, GoRouterState state) {
            return const AStarScreen();
          },
        ),
      ],
    ),
  ],
);
