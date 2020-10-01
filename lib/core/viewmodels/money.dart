import 'package:flutter/material.dart';

class Money with ChangeNotifier {
  int _balance = 5000;
  int get balance => _balance;

  void decreaseBalance(int value) {
    _balance -= value;
    notifyListeners();
  }
}
