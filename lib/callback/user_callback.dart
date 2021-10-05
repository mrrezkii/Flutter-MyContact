import 'package:my_contact/model/user.dart';

abstract class UserCallback {
  bool addUser(User user);
  bool editUser(User user);
  bool deleteUser(User user);

  bool editUser2(User user, int index);
}
