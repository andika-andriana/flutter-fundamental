import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  int _timer = 100;

  int get timer => _timer;
  set timer(int newQuantity) {
    _timer = newQuantity;
    notifyListeners();
  }
}
