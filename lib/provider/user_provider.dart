import 'package:flutter/material.dart';
import 'package:my_contact/callback/user_callback.dart';
import 'package:my_contact/model/user.dart';

class UserProvider extends ChangeNotifier implements UserCallback {
  List<User> _users = mockUser;

  List<User> get getAllUser {
    return _users;
  }

  User getUser(String id) {
    return _users.firstWhere((user) => user.id! == id);
  }

  bool getPriority(User user) {
    final int index = _users.indexWhere((element) => element.id == user.id);
    return _users[index].priority!;
  }

  @override
  bool addUser(User user) {
    try {
      _users.add(user);
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
    }

    return false;
  }

  @override
  bool deleteUser(User user) {
    try {
      _users.remove(user);
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
    }

    return false;
  }

  @override
  bool editUser(User user) {
    try {
      var obj = getUser(user.id!);
      final int index = _users.indexWhere((element) => element.id == obj.id);
      _users[index] = user;
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
    }

    return false;
  }

  @override
  bool editPriority(User user) {
    try {
      var data = getPriority(user);
      user.priority = !data;
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
    }

    return false;
  }
}
