import 'rating_model.dart';

class DishModel {
  final String id;
  final String name;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> tags;
  final double price;
  final String categoryId;
  final bool isVeg;
  final bool isVegan;
  final double avgRating;
  final List<RatingModel> ratings;

  DishModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.ingredients,
    required this.tags,
    required this.price,
    required this.categoryId,
    required this.isVeg,
    required this.isVegan,
    required this.avgRating,
    required this.ratings,
  });

  factory DishModel.fromMap(Map<String, dynamic> map, String id) {
    return DishModel(
      id: id,
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      ingredients: List<String>.from(map['ingredients'] ?? []),
      tags: List<String>.from(map['tags'] ?? []),
      price: map['price']?.toDouble() ?? 0.0,
      categoryId: map['categoryId'] ?? '',
      isVeg: map['isVeg'] ?? false,
      isVegan: map['isVegan'] ?? false,
      avgRating: map['avgRating']?.toDouble() ?? 0.0,
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
      'ingredients': ingredients,
      'tags': tags,
      'price': price,
      'categoryId': categoryId,
      'isVeg': isVeg,
      'isVegan': isVegan,
      'avgRating': avgRating,
      'ratings': ratings.map((r) => r.toMap()).toList(),
    };
  }
}
