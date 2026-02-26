import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_gym_bro/core/storage/core_storage.dart';

class Storage implements CoreStorage {
  Storage._internal();

  static Storage? _instance;
  late SharedPreferences _prefs;

  static Future<Storage> getInstance() async {
    if (_instance == null) {
      final prefs = await SharedPreferences.getInstance();
      _instance = Storage._internal();
      _instance!._prefs = prefs;
    }
    return _instance!;
  }

  @override
  Future<void> clear() async {
    await _prefs.clear();
  }

  @override
  Future<bool?> getBool(String key) async {
    return _prefs.getBool(key);
  }

  @override
  Future<double?> getDouble(String key) async {
    return _prefs.getDouble(key);
  }

  @override
  Future<int?> getInt(String key) async {
    return _prefs.getInt(key);
  }

  @override
  Future<String?> getString(String key) async {
    return _prefs.getString(key);
  }

  @override
  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }

  @override
  Future<void> setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  @override
  Future<void> setDouble(String key, double value) async {
    await _prefs.setDouble(key, value);
  }

  @override
  Future<void> setInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  @override
  Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }
}
