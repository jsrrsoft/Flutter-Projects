import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../views/movie_detail.dart';

class MovieGrid extends StatelessWidget {
  const MovieGrid({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy movies for demonstration
    final movies = [
      Movie(
        id: '1',
        title: 'Flutter Adventures',
        genre: 'Action',
        language: 'English',
        ageRating: 'PG-13',
        showtimes: ['10:00 AM', '2:00 PM'],
        trailerUrl: 'https://www.youtube.com/watch?v=gDOjCXmKn_c',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqNOkii5h0uoxxE-1plaBoJ4UmvFupH7gEow&s',
        cast: ['Actor A', 'Actor B'],
      )
      // Add more movies...
    ];

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: movies.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final movie = movies[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetail(movie: movie),
            ),
          ),
          child: Card(
            child: Column(
              children: [
                Image.network(movie.imageUrl),
                Text(movie.title),
              ],
            ),
          ),
        );
      },
    );
  }
}