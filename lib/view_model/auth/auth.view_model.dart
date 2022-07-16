import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_practice/models/UserModel.dart';
import 'package:mvvm_practice/repository/auth/auth.repository.dart';
import 'package:mvvm_practice/utils/messages/app.messages.utils.dart';
import 'package:mvvm_practice/utils/routes/routes_name.routes.utils.dart';
import 'package:mvvm_practice/view/Services/splash.services.view.dart';
import 'package:mvvm_practice/view_model/User/user_viewmodel.user.view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _authRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool newValue) {
    _loading = newValue;
    notifyListeners();
  }

  Future<void> loginUser(dynamic data, BuildContext context) async {
    setLoading(true);
    _authRepo.userLogin(data).then((value) {
      setLoading(false);
      final userPref = Provider.of<UserViewModel>(context, listen: false);
      userPref.saveUserData(
        UserModel(
          token: value['token'].toString(),
        ),
      );
      AppMessages.flushBarMessage(
          context, "Yay ! Login Successfully 😊", Colors.green, Icons.done);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      AppMessages.flushBarMessage(context, "Ohh snap ! something went wrong 😔",
          Colors.red, Icons.error);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> registerUser(dynamic data, BuildContext context) async {
    setLoading(true);
    _authRepo.userRegister(data).then((value) {
      setLoading(false);
      AppMessages.flushBarMessage(
          context,
          "Yay ! Your account created Successfully 😊",
          Colors.green,
          Icons.done);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(true);
      AppMessages.flushBarMessage(context, "Ohh snap ! something went wrong 😔",
          Colors.red, Icons.error);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
