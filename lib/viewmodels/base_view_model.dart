import 'package:flutter/material.dart';

abstract class BaseViewModel with ChangeNotifier {
  late BuildContext _context;

  BuildContext get context => _context;

  void onInitView(BuildContext context) {
    _context = context;
  }

  void updateUI() {
    notifyListeners();
  }
}