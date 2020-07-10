import 'dart:math';

import 'package:flutter/material.dart';

class NameModel with ChangeNotifier {
  String _name = "test flutter";

  String get value => _name;

  void changeName() {
    List<String> nameList = ['flutter one', 'flutter two', 'flutter three'];
    int pos = Random().nextInt(3);
    if (_name != nameList[pos]) {
      _name = nameList[pos];
      notifyListeners();
    }
  }
}
