import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchQuery = '';
  String selectedFilter = 'All'; // Default filter

  // Logout function
  void _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    if (context.mounted) {
      context.go('/login');  // Navigate to the login screen after logout
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FastBite Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),  // Logout button action
          ),
        ],
      ),
      body: Column(
        children: [
          // SearchBar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBar(
              onSearch: (query) {
                setState(() {
                  searchQuery = query;
                });
              },
            ),
          ),
          // FilterBar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FilterBar(
              selectedFilter: selectedFilter,
              onFilterSelected: (filter) {
                setState(() {
                  selectedFilter = filter;
                });
              },
            ),
          ),
          // Category Grid
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                CategoryButton(category: 'Pizza', context: context),
                CategoryButton(category: 'Biryani', context: context),
                CategoryButton(category: 'Salad', context: context),
                CategoryButton(category: 'Dessert', context: context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// SearchBar Widget
class SearchBar extends StatelessWidget {
  final Function(String) onSearch;

  const SearchBar({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onSearch,
      decoration: InputDecoration(
        labelText: 'Search dishes',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIcon: const Icon(Icons.search),
      ),
    );
  }
}

// FilterBar Widget
class FilterBar extends StatelessWidget {
  final String selectedFilter;
  final Function(String) onFilterSelected;

  const FilterBar({super.key, required this.selectedFilter, required this.onFilterSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FilterChip(
          label: const Text('All'),
          selected: selectedFilter == 'All',
          onSelected: (isSelected) => onFilterSelected('All'),
        ),
        const SizedBox(width: 8),
        FilterChip(
          label: const Text('Veg'),
          selected: selectedFilter == 'Veg',
          onSelected: (isSelected) => onFilterSelected('Veg'),
        ),
        const SizedBox(width: 8),
        FilterChip(
          label: const Text('Non-Veg'),
          selected: selectedFilter == 'Non-Veg',
          onSelected: (isSelected) => onFilterSelected('Non-Veg'),
        ),
        const SizedBox(width: 8),
        FilterChip(
          label: const Text('Vegan'),
          selected: selectedFilter == 'Vegan',
          onSelected: (isSelected) => onFilterSelected('Vegan'),
        ),
        const SizedBox(width: 8),
        FilterChip(
          label: const Text('Price'),
          selected: selectedFilter == 'Price',
          onSelected: (isSelected) => onFilterSelected('Price'),
        ),
      ],
    );
  }
}

// Category Button Widget (for displaying categories)
class CategoryButton extends StatelessWidget {
  final String category;
  final BuildContext context;

  const CategoryButton({super.key, required this.category, required this.context});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to CategoryDetailScreen with the selected category
        context.go('/home/category/$category');
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text(
            category,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
