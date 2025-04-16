import 'package:fastbiteapp/data/dummy_restaurants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RestaurantListScreen extends StatelessWidget {
  final String categoryId;
  const RestaurantListScreen({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    final restaurants = dummyRestaurants.where((r) => r.dishIds.any((dishId) => dishId.startsWith('d'))).toList();
    final isWide = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(title: const Text("Restaurants")),
      body: GridView.count(
        crossAxisCount: isWide ? 3 : 1,
        padding: const EdgeInsets.all(16),
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        children: restaurants.map((restaurant) {
          return GestureDetector(
            onTap: () => context.go('/dishes/${restaurant.dishIds.first}'),
            child: Card(
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.network(
                      restaurant.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurant.name,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text("Rating: ${restaurant.avgRating.toStringAsFixed(1)}"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
