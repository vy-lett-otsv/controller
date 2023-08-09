import 'package:flutter/material.dart';

class TimeViewModel extends ChangeNotifier{
  String text = '';

  void setText() {
    text = DateTime.now().toString();
    notifyListeners();
  }
}