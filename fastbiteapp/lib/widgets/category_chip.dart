import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final List<String> categories;
  final Function(String) onCategorySelected;

  const CategoryChip({
    required this.categories,
    required this.onCategorySelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: categories.map((name) {
        return ActionChip(
          label: Text(name),
          onPressed: () => onCategorySelected(name),
        );
      }).toList(),
    );
  }
}
