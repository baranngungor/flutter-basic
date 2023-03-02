import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:userapp/models/user_model.dart';

class AppPreferences {
  static AppPreferences? _instance;
  static SharedPreferences? preferences;
  static Future<AppPreferences> get instance async {
    preferences = await SharedPreferences.getInstance();
    _instance ??= AppPreferences._init();
    return _instance!;
  }

  AppPreferences._init();

  UserModel? get getUser =>
      UserModel.fromJson(json.decode(preferences!.getString('user')!));
  UserModel? get getToken =>
      UserModel.fromJson(json.decode(preferences!.getString('token')!));

  Future<bool>? setUser(UserModel? user) =>
      preferences?.setString('user', json.encode(user?.toJson()));
  Future<bool>? setToken(String token) =>
      preferences?.setString('token', token);

  Future<bool>? deleteItem(key) => preferences?.remove('$key');
}
