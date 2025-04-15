import 'package:flutter/material.dart';

class DishDetailScreen extends StatelessWidget {
  final String dishId;

  const DishDetailScreen({super.key, required this.dishId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dish $dishId')),
      body: Center(child: Text('Details for dish $dishId')),
    );
  }
}
