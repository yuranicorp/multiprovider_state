import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  int _quantity = 0;
  int get quantity => _quantity;

  int applePrice = 500;

  void addQuantity(int value) {
    _quantity += value;
    notifyListeners();
  }
}
