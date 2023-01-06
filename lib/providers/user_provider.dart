import 'package:lottery/models/user.dart';

class UserProvider {
  Map<String,String> headers = {'Content-Type': 'application/json; charset=UTF-8'};

  User _user = User( id: "", userName: "", email: "", password: "", cart: []);
  User get user => _user;
  void setUser(String user) {
    _user = User.fromJson(user);
  }

  void reSetUser() {
    _user = User(id: "",userName: "", email: "", password: "", cart: []);
  }
}
