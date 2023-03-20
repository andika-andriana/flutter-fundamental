import 'package:flutter/material.dart';

class BalanceProvider extends ChangeNotifier {
  int _balance = 50000;

  int get balance => _balance;
  set balance(int newBalance) {
    if (newBalance >= 0) {
      _balance = newBalance;
      notifyListeners();
    }
  }
}
