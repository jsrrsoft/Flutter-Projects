// ignore_for_file: file_names

import 'package:fastbiteapp/screens/home/category_detail_screen.dart';
import 'package:fastbiteapp/screens/home/dish_detail_screen.dart';
import 'package:fastbiteapp/screens/home_screen.dart';
import 'package:fastbiteapp/screens/login_screen.dart';
import 'package:fastbiteapp/screens/signup_screen.dart';
import 'package:fastbiteapp/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FastBiteApp extends StatelessWidget {
  const FastBiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'FastBite',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
      routes: [
        // Category detail page route with dynamic categoryId
        GoRoute(
          path: 'category/:categoryId',
          builder: (context, state) {
            final categoryId = state.pathParameters['categoryId']!;
            return CategoryDetailScreen(categoryId: categoryId);
          },
          routes: [
            // Dish detail page route with dynamic dishId
            GoRoute(
              path: 'dish/:dishId',
              builder: (context, state) {
                final dishId = state.pathParameters['dishId']!;
                return DishDetailScreen(dishId: dishId);
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
