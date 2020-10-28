import 'dart:collection';

import 'package:flutter/cupertino.dart';

class Item {
  final int count;
  final double price;

  Item(this.count, this.price);
}
class CartModel extends ChangeNotifier {
  final List<Item> _list = [];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_list);

  double get totalPrice =>
      _list.fold(0, (value, item) => value + item.price * item.count);

  void add(Item item) {
    _list.add(item);
    notifyListeners();
  }
}
