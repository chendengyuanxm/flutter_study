import 'package:flutter/material.dart';

class TabIndex with ChangeNotifier {
  int index = 0;

  changeIndex(int newIndex) {
    index = newIndex;
    notifyListeners();
  }
}