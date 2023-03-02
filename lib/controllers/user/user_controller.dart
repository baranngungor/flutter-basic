import 'package:flutter/material.dart';
import 'package:userapp/models/response/response_model.dart';
import 'package:userapp/models/user_model.dart';
import 'package:userapp/services/app_preferences.dart';
import 'package:userapp/services/network_service.dart';

class UserController extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController(),
      nameController = TextEditingController(),
      surnameController = TextEditingController();
  UserModel? activeUser, localUser;
  late AppPreferences appPreferences;

  Future login(LoginModel? loginModel) async {
    bool isLogin;
    isLogin = await NetworkService.instance
        .postMethod("htss", loginModel?.toJson())
        .then((value) {
      if (value is String) {
        return false;
      } else {
        if ((value as ResponseModel).success == true &&
            (value).meta.httpStatusCode == 200) {
          return true;
        }
      }
      return false;
    });
    return isLogin;
  }

  controllersClear() {
    usernameController.clear();
    nameController.clear();
    surnameController.clear();
    notifyListeners();
  }

  Future<bool> createUserFromJson(username, name, surname) async {
    await Future.delayed(
      const Duration(seconds: 2),
      () async {
        Map tempUserJson = {
          "username": username,
          "name": name,
          "surname": surname
        };
        activeUser = UserModel.fromJson(tempUserJson);
        appPreferences = await AppPreferences.instance;
        appPreferences.setUser(activeUser);
      },
    );
    notifyListeners();
    return Future.value(true);
  }

  getLocalUser() async {
    AppPreferences? appPreferences = await AppPreferences.instance;
    localUser = appPreferences.getUser;
    notifyListeners();
  }

  removeLocalUser() async {
    AppPreferences? appPreferences = await AppPreferences.instance;
    appPreferences.deleteItem('user')?.then((value) {
      if (value == true) {
        localUser = null;
      }
    });
    notifyListeners();
  }
}
