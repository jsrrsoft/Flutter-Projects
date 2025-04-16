import 'rating_model.dart';

class RestaurantModel {
  final String id;
  final String name;
  final String imageUrl;
  final List<String> categories;
  final String location;
  final List<String> dishIds;
  final double avgRating; // Optional: Stored average for Firestore sorting
  final List<RatingModel> ratings;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.location,
    required this.dishIds,
    required this.avgRating,
    required this.categories,
    this.ratings = const [],
  });

  /// Average rating based on the current list of ratings
  double get averageRating {
    if (ratings.isEmpty) return 0.0;
    double total = ratings.fold(0.0, (sum, r) => sum + r.value);
    return total / ratings.length;
  }

  factory RestaurantModel.fromMap(Map<String, dynamic> map, String id) {
    return RestaurantModel(
      id: id,
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      location: map['location'] ?? '',
      dishIds: List<String>.from(map['dishIds'] ?? []),
      avgRating: map['avgRating']?.toDouble() ?? 0.0,
      categories: List<String>.from(map['categories'] ?? []),
      ratings: map['ratings'] != null
          ? List<RatingModel>.from(
              (map['ratings'] as List).map((r) => RatingModel.fromMap(r)))
          : [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'location': location,
      'dishIds': dishIds,
      'avgRating': avgRating,
      'categories': categories,
      'ratings': ratings.map((r) => r.toMap()).toList(),
    };
  }
}
