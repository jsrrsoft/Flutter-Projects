import 'package:fastbiteapp/model/dish_model.dart';
import 'package:fastbiteapp/model/restaurant_model.dart';

class SearchService {
  List<String> autocompleteSuggestions(String query, List<DishModel> dishes, List<RestaurantModel> restaurants) {
    final lowerQuery = query.toLowerCase();
    final dishMatches = dishes
        .where((dish) => dish.name.toLowerCase().contains(lowerQuery))
        .map((dish) => dish.name);

    final restaurantMatches = restaurants
        .where((rest) => rest.name.toLowerCase().contains(lowerQuery))
        .map((rest) => rest.name);

    return {...dishMatches, ...restaurantMatches}.toList(); // remove duplicates
  }
}
