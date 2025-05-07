import 'package:flutter/material.dart';

class FilterBar extends StatelessWidget {
  final Function(String) onFilterSelected;

  const FilterBar({required this.onFilterSelected, super.key});

  @override
  Widget build(BuildContext context) {
    final filters = ['Veg', 'Non-Veg', 'Vegan', 'Price'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: filters.map((filter) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: ElevatedButton(
            onPressed: () => onFilterSelected(filter),
            child: Text(filter),
          ),
        );
      }).toList(),
    );
  }
}
