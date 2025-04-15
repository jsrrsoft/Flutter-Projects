import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';

class CategoryDetailScreen extends StatefulWidget {
  final String categoryId;
  const CategoryDetailScreen({super.key, required this.categoryId});

  @override
  // ignore: library_private_types_in_public_api
  _CategoryDetailScreenState createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Search Dishes'),
          onChanged: (value) {
            setState(() {
              searchQuery = value.toLowerCase();
            });
          },
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('categories')
                .doc(widget.categoryId)
                .collection('dishes')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return CircularProgressIndicator();
              final dishes = snapshot.data!.docs.where((doc) {
                final name = doc['name'].toString().toLowerCase();
                return name.contains(searchQuery);
              }).toList();
              return ListView.builder(
                itemCount: dishes.length,
                itemBuilder: (context, index) {
                  final dish = dishes[index];
                  return ListTile(
                    title: Text(dish['name']),
                    onTap: () => context.go('/home/category/${widget.categoryId}/dish/${dish.id}'),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
