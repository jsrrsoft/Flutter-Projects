import 'package:flutter/material.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FilterChip(label: Text('Veg'), onSelected: (bool value) {}),
          FilterChip(label: Text('Non-Veg'), onSelected: (bool value) {}),
          FilterChip(label: Text('Vegan'), onSelected: (bool value) {}),
          FilterChip(label: Text('Price'), onSelected: (bool value) {}),
        ],
      ),
    );
  }
}
