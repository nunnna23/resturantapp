import 'package:flutter/material.dart';
import 'package:restaurantmobileapp/models/fooditem.dart';

class CartProvider with ChangeNotifier {
  final List<FoodItem> _cart = [];

  List<FoodItem> get cart => _cart;

  void addToCart(FoodItem item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeFromCart(FoodItem item) {
    _cart.remove(item);
    notifyListeners();
  }

  double get totalPrice => _cart.fold(0, (sum, item) => sum + item.price);
}
