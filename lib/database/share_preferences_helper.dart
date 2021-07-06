import 'package:flutter_app/utils/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const _token = '_token';
  static const _introKey = '_introKey';

  static const _authKey = '_authKey';

  //Get authKey
  static Future<String> getApiTokenKey() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(_authKey) ?? "";
    } catch (e) {
      logger.e(e);
      return "";
    }
  }

  //Set authKey
  static void setApiTokenKey(String apiTokenKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_authKey, apiTokenKey);
  }

  static void removeApiTokenKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_authKey);
  }

  //Get intro
  static Future<bool> isSeenIntro() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_introKey) ?? false;
    } catch (e) {
      logger.e(e);
      return false;
    }
  }

  //Set intro
  static void setSeenIntro({isSeen = true}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_introKey, isSeen ?? true);
  }
}
