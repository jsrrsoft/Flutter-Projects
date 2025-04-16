import 'package:fastbiteapp/model/dish_model.dart';
import 'package:fastbiteapp/model/rating_model.dart';

final List<DishModel> dummyDishes = [
  DishModel(
    id: 'd1',
    name: 'Margherita Pizza',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/c/c8/Pizza_Margherita_stu_spivack.jpg',
    ingredients: ['Cheese', 'Tomato Sauce', 'Basil'],
    tags: ['Cheesy', 'Classic'],
    price: 8.99,
    categoryId: '1',
    isVeg: true,
    isVegan: false,
    avgRating: 4.3,
    ratings: [
      RatingModel(
        userId: 'u1',
        comment: 'Delicious and fresh!',
        rating: 4.5,
        timestamp: DateTime.now(),
        value: 5.0,
      ),
    ],
  ),
  DishModel(
    id: 'd2',
    name: 'Chicken Biryani',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/%22Hyderabadi_Dum_Biryani%22.jpg/1200px-%22Hyderabadi_Dum_Biryani%22.jpg',
    ingredients: ['Rice', 'Chicken', 'Spices'],
    tags: ['Spicy', 'Aromatic'],
    price: 10.5,
    categoryId: '2',
    isVeg: false,
    isVegan: false,
    avgRating: 4.7,
    ratings: [
      RatingModel(
        userId: 'u2',
        comment: 'Full of flavor!',
        rating: 4.8,
        timestamp: DateTime.now(),
        value: 5.0,
      ),
    ],
  ),
  DishModel(
    id: 'd3',
    name: 'Greek Salad',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Greek_Salad_from_Thessaloniki.jpg/320px-Greek_Salad_from_Thessaloniki.jpg',
    ingredients: ['Feta', 'Olives', 'Tomatoes', 'Cucumber'],
    tags: ['Healthy', 'Fresh'],
    price: 6.75,
    categoryId: '3',
    isVeg: true,
    isVegan: false,
    avgRating: 4.1,
    ratings: [
      RatingModel(
        userId: 'u3',
        comment: 'So refreshing!',
        rating: 4.0,
        timestamp: DateTime.now(),
        value: 5.0,
      ),
    ],
  ),
];
