import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:fastbiteapp/widgets/category_chip.dart';
import 'package:fastbiteapp/widgets/restaurant_card.dart';
import 'package:fastbiteapp/widgets/filter_bar.dart';
import 'package:fastbiteapp/data/dummy_categories.dart'; // Import actual categories data
import 'package:fastbiteapp/data/dummy_restaurants.dart'; // Import the dummy restaurants data

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
    // Extracting the list of category names from dummyCategories
    List<String> categoryNames = dummyCategories.map((category) => category.name).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('FastBite Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SearchBar(),
            const FilterBar(),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('Categories', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            CategoryChip(categories: categoryNames), // Pass category names (List<String>)
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('Featured Restaurants', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            // Displaying the restaurant cards using dummyRestaurants data
            for (var restaurant in dummyRestaurants)
              RestaurantCard(restaurant: restaurant), // Pass each restaurant to RestaurantCard
          ],
        ),
      ),
    );
  }
}
