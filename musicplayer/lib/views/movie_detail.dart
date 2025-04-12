import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;

  const MovieDetail({super.key, required this.movie});

 void _launchTrailer() async {
  final Uri url = Uri.parse('https://www.youtube.com/watch?v=gDOjCXmKn_c');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              movie.imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(Icons.broken_image, size: 80, color: Colors.grey),
                );
              },
            ),
            const SizedBox(height: 8),
            Text('Genre: ${movie.genre}'),
            Text('Language: ${movie.language}'),
            Text('Rating: ${movie.ageRating}'),
            const SizedBox(height: 8),
            Text('Showtimes: ${movie.showtimes.join(", ")}'),
            const SizedBox(height: 8),
            Text('Cast: ${movie.cast.join(", ")}'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _launchTrailer,
              child: const Text('Watch Trailer'),
            )
          ],
        ),
      ),
    );
  }
}