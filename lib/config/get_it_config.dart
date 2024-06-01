import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt core = GetIt.instance;

class UserSession {
  static const String _isLoggedInKey = 'isLoggedIn';

  SharedPreferences _prefs;

  UserSession(this._prefs);

  bool get isLoggedIn => _prefs.getBool(_isLoggedInKey) ?? false;

  Future<void> login() async {
    await _prefs.setBool(_isLoggedInKey, true);
  }

  Future<void> logout() async {
    await _prefs.setBool(_isLoggedInKey, false);
  }
}

init() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  core.registerSingleton<SharedPreferences>(prefs);
  core.registerSingleton<UserSession>(UserSession(prefs));
}

Future<void> clearSharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}
