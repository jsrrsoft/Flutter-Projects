import 'package:fastbiteapp/model/category_model.dart';
import 'package:fastbiteapp/model/dish_model.dart';
import 'package:flutter/material.dart';
import 'package:fastbiteapp/data/dummy_dishes.dart';
import 'package:fastbiteapp/data/dummy_categories.dart';
import 'package:collection/collection.dart';

class DishDetailScreen extends StatelessWidget {
  final String dishId;

  const DishDetailScreen({super.key, required this.dishId});

  String getCategoryName(String categoryId) {
    final category = dummyCategories.firstWhere(
      (cat) => cat.id == categoryId,
      orElse: () => CategoryModel(id: '', name: 'Unknown', imageUrl: ''),
    );
    return category.name;
  }

  @override
  Widget build(BuildContext context) {
    final DishModel? dish = dummyDishes.firstWhereOrNull((d) => d.id == dishId);

    if (dish == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Dish Not Found")),
        body: const Center(child: Text("The dish you are looking for doesn't exist.")),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(dish.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(dish.imageUrl, height: 200, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Text(
              dish.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text("Category: ${getCategoryName(dish.categoryId)}"),
            Text("₹${dish.price.toStringAsFixed(2)}"),
            Text("Veg: ${dish.isVeg ? 'Yes' : 'No'}"),
            Text("Vegan: ${dish.isVegan ? 'Yes' : 'No'}"),
            const SizedBox(height: 16),
            const Text("Ingredients:", style: TextStyle(fontWeight: FontWeight.bold)),
            ...dish.ingredients.map((i) => Text("• $i")),
            const SizedBox(height: 16),
            const Text("Tags:", style: TextStyle(fontWeight: FontWeight.bold)),
            Wrap(
              spacing: 8.0,
              children: dish.tags.map((tag) => Chip(label: Text(tag))).toList(),
            ),
            const SizedBox(height: 16),
            Text("Rating: ${dish.avgRating.toStringAsFixed(1)} ⭐"),
          ],
        ),
      ),
    );
  }
}
