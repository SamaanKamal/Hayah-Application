import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future saveData({required key, required value}) async {
    return sharedPreferences!.setBool(key, value);
  }

  static Future saveDataString({required key, required value}) async {
    return sharedPreferences!.setString(key, value);
  }

  static getData({required key}) {
    return sharedPreferences!.get(key);
  }
}
