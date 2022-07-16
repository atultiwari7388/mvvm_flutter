import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_practice/models/UserModel.dart';
import 'package:mvvm_practice/utils/routes/routes_name.routes.utils.dart';
import 'package:mvvm_practice/view_model/User/user_viewmodel.user.view_model.dart';

class SplashService {
  Future<UserModel> getUserData() => UserViewModel().getUserData();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) {
      if (value.token == null || value.token == "") {
        Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.home, (route) => false);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
