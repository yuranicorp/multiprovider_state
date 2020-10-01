import 'package:flutter/material.dart';

class MoneyProvider with ChangeNotifier {
  int _balance = 5000;
  int get balance => _balance;

  /// Decrease balance after add item to cart
  void decreaseBalance(int value) {
    _balance -= value;
    notifyListeners();
  }
}
