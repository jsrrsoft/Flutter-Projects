class Movie {
  final String id;
  final String title;
  final String genre;
  final String language;
  final String ageRating;
  final List<String> showtimes;
  final String trailerUrl;
  final String imageUrl;
  final List<String> cast;

  Movie({
    required this.id,
    required this.title,
    required this.genre,
    required this.language,
    required this.ageRating,
    required this.showtimes,
    required this.trailerUrl,
    required this.imageUrl,
    required this.cast,
  });
}
