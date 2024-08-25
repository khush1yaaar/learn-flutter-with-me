import 'dart:collection';

import 'package:flutter/material.dart';

class NumbersChangeNotifier extends ChangeNotifier {
  final List<int> _numbers = [];

  UnmodifiableListView<int> get numbers => UnmodifiableListView(_numbers);
  void add(int num) {
    _numbers.add(num);
    notifyListeners();
  }
}