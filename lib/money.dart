import 'package:flutter/foundation.dart';

class Money with ChangeNotifier {
  int _balance = 0;

  int get balance => _balance;

  set balance(int value) {
    balance = value;
    notifyListeners();
  }
}
