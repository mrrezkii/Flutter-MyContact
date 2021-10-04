import 'package:flutter/material.dart';

class StarProvider extends ChangeNotifier {
  bool _isFavourite = false;

  bool get isFavourite => _isFavourite;

  void changeFavourite() {
    _isFavourite = !_isFavourite;
    notifyListeners();
  }
}
