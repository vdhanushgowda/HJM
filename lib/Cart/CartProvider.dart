import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addItem(Map<String, dynamic> item) {
    _cartItems.add(item);
    notifyListeners();  // Notify listeners to update UI
  }

  void removeItem(int index) {
    _cartItems.removeAt(index);
    notifyListeners();  // Notify listeners to update UI
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();  // Notify listeners to update UI
  }
}
