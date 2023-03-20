import 'package:flutter/material.dart';

class QuantityProvider extends ChangeNotifier {
  int _quantity = 0;

  int get quantity => _quantity;
  set quantity(int newQuantity) {
    if (newQuantity >= 0) {
      _quantity = newQuantity;
      notifyListeners();
    }
  }
}
