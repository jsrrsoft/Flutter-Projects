import 'package:fastbiteapp/screens/home/category_tile.dart';
import 'package:fastbiteapp/screens/home/dish_tile.dart';
import 'package:fastbiteapp/screens/home/mock_dishes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    if (context.mounted) {
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isWeb = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      appBar: AppBar(
        title: const Text('FastBite Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: mockCategories.map((category) => CategoryTile(category)).toList(),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Popular Dishes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.count(
                crossAxisCount: isWeb ? 4 : 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: mockDishes.map((dish) => DishTile(dish)).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
