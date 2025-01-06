import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> setBoolean(
      {required String key, required bool value}) async {
    print('setbool');

    await _preferences?.setBool(key, value);
  }

  static bool? getBoolean({required String key}) {
    print('getbool');

    return _preferences?.getBool(key);
  }

  static Future<void> setString(
      {required String key, required String value}) async {
    print('setstring');
    await _preferences?.setString(key, value);
  }

  static String? getString({required String key}) {
    print('getstring');
    return _preferences?.getString(key);
  }

  static Future<void> setInt({required String key, required int value}) async {
    await _preferences?.setInt(key, value);
  }

  static int? getInt({required String key}) {
    return _preferences?.getInt(key);
  }

  static Future<void> setDouble(
      {required String key, required double value}) async {
    await _preferences?.setDouble(key, value);
  }

  static double? getDouble({required String key}) {
    return _preferences?.getDouble(key);
  }

  static Future<void> removeData({required String key}) async {
    print('removue');
    await _preferences?.remove(key);
  }

  static Future<void> clearAll() async {
    await _preferences?.clear();
  }
}
