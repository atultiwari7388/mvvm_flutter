import 'package:flutter/cupertino.dart';
import 'package:mvvm_practice/models/UserModel.dart';
import 'package:mvvm_practice/resources/constants/app_urls.constants.resources.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  //save user data
  Future<bool> saveUserData(UserModel userModel) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString(AppConstants.token, userModel.token.toString());
    notifyListeners();
    return true;
  }

  //get user data
  Future<UserModel> getUserData() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    final String? token = sharedPrefs.getString(AppConstants.token);

    return UserModel(
      token: token.toString(),
    );
  }

  //remove or logout userData
  Future<bool> logoutUser() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.remove(AppConstants.token);
    return true;
  }
}
