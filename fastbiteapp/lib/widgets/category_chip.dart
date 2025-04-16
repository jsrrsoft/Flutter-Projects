import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final List<String> categories;

  const CategoryChip({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: categories
          .map((category) => GestureDetector(
                onTap: () {
                  // Navigate to category details
                  Navigator.pushNamed(context, '/home/category/$category');
                },
                child: Chip(
                  label: Text(category),
                ),
              ))
          .toList(),
    );
  }
}
