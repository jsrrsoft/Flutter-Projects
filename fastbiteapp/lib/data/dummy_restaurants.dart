
import 'package:fastbiteapp/model/rating_model.dart';
import 'package:fastbiteapp/model/restaurant_model.dart';

final List<RestaurantModel> dummyRestaurants = [
  RestaurantModel(
    id: 'r1',
    name: 'Pizza Palace',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/36/DiFara1.JPG',
    location: 'Downtown',
    dishIds: ['d1'],
    avgRating: 4.4,
    categories: ['Pizza', 'Italian'], 
    ratings: [
      RatingModel(
        userId: 'u1',
        comment: 'Best pizza in town!',
        rating: 4.5,
        timestamp: DateTime.now(),
        value: 5.0,
      ),
    ],
  ),
  RestaurantModel(
    id: 'r2',
    name: 'Royal Biryani House',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKWBCgc2CJzHE8xRs788WceomRFTgUlHIOBQ&s',
    location: 'Old City',
    dishIds: ['d2'],
    avgRating: 4.8,
    categories: ['Biryani', 'Indian'],
    ratings: [
      RatingModel(
        userId: 'u2',
        comment: 'Authentic taste!',
        rating: 5.0,
        timestamp: DateTime.now(),
        value: 5.0,
      ),
      
    ],
  ),
  RestaurantModel(
    id: 'r3',
    name: 'Green Bowl',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Hollywood_Bowl_2024.jpg/1200px-Hollywood_Bowl_2024.jpg',
    location: 'Market Street',
    dishIds: ['d3'],
    avgRating: 4.2,
    categories: ['Fresh', 'American'],
    ratings: [
      RatingModel(
        userId: 'u3',
        comment: 'Very fresh and tasty!',
        rating: 4.2,
        timestamp: DateTime.now(),
        value: 5.0,
      ),
    ],
  ),
];
