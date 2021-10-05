import 'package:flutter/material.dart';
import 'package:my_contact/callback/user_callback.dart';
import 'package:my_contact/model/user.dart';

class UserProvider extends ChangeNotifier implements UserCallback {
  List<User> _users = mockUser;

  List<User> get getAllUser {
    return _users;
  }

  User getUser(int id) {
    return _users.firstWhere((user) => user.id == id);
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
      var obj = getUser(user.id);
      _users[obj.id] = user;
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
    }

    return false;
  }

  @override
  bool editUser2(User user, int index) {
    try {
      getAllUser[index] = user;
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
    }

    return false;
  }
}
