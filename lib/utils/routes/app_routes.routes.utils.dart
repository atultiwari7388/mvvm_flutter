import 'package:flutter/material.dart';
import 'package:mvvm_practice/utils/routes/routes_name.routes.utils.dart';
import 'package:mvvm_practice/view/auth/login.auth.view.dart';
import 'package:mvvm_practice/view/auth/register.auth.view.dart';
import 'package:mvvm_practice/view/home/home.home.view.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const HomeView(),
        );

      case RoutesName.login:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const LoginView(),
        );

      case RoutesName.register:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const RegisterView(),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text("Screen does not exists !"),
              ),
            );
          },
        );
    }
  }
}
