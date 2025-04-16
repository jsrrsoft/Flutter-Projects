import 'package:fastbiteapp/model/dish_model.dart';

class FilterService {
  List<DishModel> filterDishes({
    required List<DishModel> dishes,
    String? dietary, // "Veg", "Non-Veg", "Vegan"
    double? minPrice,
    double? maxPrice,
  }) {
    return dishes.where((dish) {
      final matchesDiet = dietary == null || dish.tags.contains(dietary);
      final matchesMinPrice = minPrice == null || dish.price >= minPrice;
      final matchesMaxPrice = maxPrice == null || dish.price <= maxPrice;
      return matchesDiet && matchesMinPrice && matchesMaxPrice;
    }).toList();
  }
}
