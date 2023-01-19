import 'package:lottery/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider {
  String _token = "";
  Map<String,String> headers = {'Content-Type': 'application/json; charset=UTF-8'};
  SharedPreferences? _preferences;
  User _user = User( id: "", userName: "", email: "", password: "", cart: []);
  User get user => _user;
  void setUser(String user) {
    _user = User.fromJson(user);
  }
  Future<SharedPreferences> getPrefereces()async{
    _preferences ??= await SharedPreferences.getInstance();
    return _preferences!;
  }
  void reSetUser() {
    _user = User(id: "",userName: "", email: "", password: "", cart: []);
    
  }
  String get token => _token;
  setToken(String token)async{
      var prefs = await getPrefereces();
      await prefs.setString("x-auth-token", token);
      if(headers.keys.contains('x-auth-token')){
        headers['x-auth-token'] = token;
      }else{
        headers.putIfAbsent('x-auth-token', () => token);
      }
    _token = token;
  }
}
