import 'package:flutter/material.dart';
import 'package:fastbiteapp/model/dish_model.dart';
import 'package:fastbiteapp/data/dummy_dishes.dart'; // Assuming you have a dummy list of dishes
import 'package:go_router/go_router.dart';

class CategoryDetailScreen extends StatelessWidget {
  final String category;

  const CategoryDetailScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    // Filter dishes based on the selected category
    final List<DishModel> filteredDishes = dummyDishes
        .where((dish) => dish.categoryId == category) // Assuming categoryId matches category name
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text('$category Dishes')),
      body: filteredDishes.isEmpty
          ? const Center(child: Text('No dishes found in this category.'))
          : Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                itemCount: filteredDishes.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final dish = filteredDishes[index];
                  return GestureDetector(
                    onTap: () {
                      context.go('/home/category/$category/dish/${dish.id}');
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                            child: Image.network(
                              dish.imageUrl,
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              dish.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              dish.tags.join(', '),
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
