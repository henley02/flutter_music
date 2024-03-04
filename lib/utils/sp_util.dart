import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {
  static const String _cookie = 'cookie';
  static late final SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  ///检查登陆状态
  static bool get checkLogin => _prefs.containsKey(_cookie);

  ///获取cookie
  static String get cookie => _prefs.getString(_cookie) ?? '';

  ///设置cookie
  static set cookie(String value) => _prefs.setString(_cookie, value);

  ///清除cookie
  static void clearCookie() => _prefs.remove(_cookie);
}
