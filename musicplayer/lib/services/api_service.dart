import '../models/movie.dart';

class ApiService {
  Future<List<Movie>> fetchMovies() async {
    // Simulate fetching data
    await Future.delayed(const Duration(seconds: 1));
    return [
      Movie(
        id: '1',
        title: 'Simulated Movie',
        genre: 'Drama',
        language: 'English',
        ageRating: 'PG',
        showtimes: ['1:00 PM', '6:00 PM'],
        trailerUrl: 'https://www.youtube.com/watch?v=H6-N1v1REu8',
        imageUrl: 'https://www.nme.com/wp-content/uploads/2020/09/Muse_Simulation_Theory_Film-696x442.jpg',
        cast: ['Sample Actor'],
      )
    ];
  }
}