// ignore_for_file: file_names

import 'package:fastbiteapp/detailpage/category_detail_screen.dart';
import 'package:fastbiteapp/screens/dish_detail/dish_detail_screen.dart';
import 'package:fastbiteapp/screens/home/home_screen.dart';
import 'package:fastbiteapp/screens/auth/login_screen.dart';
import 'package:fastbiteapp/screens/auth/signup_screen.dart';
import 'package:fastbiteapp/screens/auth/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

final GoRouter _router = GoRouter(
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
        GoRoute(
          path: 'category/:category',
          builder: (context, state) {
            final categoryName = state.pathParameters['category']!; // Fix this part
            return CategoryDetailScreen(category: categoryName);
          },
          routes: [
            GoRoute(
              path: 'dish/:id', // Fixed this path for nested route
              builder: (context, state) {
                final dishId = state.pathParameters['id']!;
                return DishDetailScreen(dishId: dishId);
              },
            ),
          ],
        ),
      ],
    ),
  ],
  redirect: (context, state) {
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;
    final location = state.uri.toString();

    if (!isLoggedIn && location.startsWith('/home')) {
      return '/login';
    }

    if (isLoggedIn && (location == '/login' || location == '/signup')) {
      return '/home';
    }

    return null;
  },
);
