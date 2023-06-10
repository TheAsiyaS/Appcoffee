
import 'package:coffeeapp/db/Model/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationManager {
  static const String _kUsernameKey = 'username';
  static const String _kPasswordKey = 'password';

  User? _authenticatedUser;

  Future<void> setAuthenticatedUser(User user) async {
    _authenticatedUser = user;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kUsernameKey, user.username);
    await prefs.setString(_kPasswordKey, user.password);
  }

  Future<void> signOut() async {
    _authenticatedUser = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kUsernameKey);
    await prefs.remove(_kPasswordKey);
  }

  Future<User?> getAuthenticatedUser() async {
    if (_authenticatedUser != null) {
      return _authenticatedUser;
    } else {
      final prefs = await SharedPreferences.getInstance();
      final username = prefs.getString(_kUsernameKey);
      final password = prefs.getString(_kPasswordKey);
      if (username != null && password != null) {
        _authenticatedUser = User(username: username, password: password);
        return _authenticatedUser;
      } else {
        return null;
      }
    }
  }
}