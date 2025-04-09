import 'dart:convert';
import 'package:kiosk_new/models/users.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  final key = 'userData';
  Future loadSaveModelPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final value = json.decode(prefs.getString(key)!);
    return (User.fromJson(value)); //return user
  }

  Future saveUserModelPrefs(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  Future removeUserModelPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
