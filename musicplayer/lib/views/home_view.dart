import 'package:flutter/material.dart';
import '../widgets/movie_grid.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Youtube Cinemas')),
      body: const MovieGrid(),
    );
  }
}
