import 'package:flutter/material.dart';

enum behavior { detailData, addData, editData, onEdit }

class BehaviorProvider extends ChangeNotifier {
  var _condition = behavior.detailData;

  get getCondition {
    return _condition;
  }

  set condition(value) {
    condition = value;
    notifyListeners();
  }
}
