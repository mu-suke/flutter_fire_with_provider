import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterService with ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}
