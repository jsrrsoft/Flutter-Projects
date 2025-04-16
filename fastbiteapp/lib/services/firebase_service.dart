import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastbiteapp/model/category_model.dart';
import 'package:fastbiteapp/model/dish_model.dart';
import 'package:fastbiteapp/model/restaurant_model.dart';

class FirebaseService {
  final _firestore = FirebaseFirestore.instance;

  Future<List<DishModel>> fetchDishes() async {
    final snapshot = await _firestore.collection('dishes').get();
    return snapshot.docs.map((doc) => DishModel.fromMap(doc.data(), doc.id)).toList();
  }

  Future<List<RestaurantModel>> fetchRestaurants() async {
    final snapshot = await _firestore.collection('restaurants').get();
    return snapshot.docs.map((doc) => RestaurantModel.fromMap(doc.data(), doc.id)).toList();
  }

  Future<List<CategoryModel>> fetchCategories() async {
    final snapshot = await _firestore.collection('categories').get();
    return snapshot.docs.map((doc) => CategoryModel.fromMap(doc.data(), doc.id)).toList();
  }
}
