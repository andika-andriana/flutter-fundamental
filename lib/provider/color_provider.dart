import 'package:flutter/material.dart';

class ColorProvider with ChangeNotifier {
  bool _isLightBlue = false;

  bool get isLightBlue => _isLightBlue;
  set isLightBlue(bool newBool) {
    _isLightBlue = newBool;
    notifyListeners();
  }

  Color get color => _isLightBlue ? Colors.lightBlue : Colors.amber;
}
