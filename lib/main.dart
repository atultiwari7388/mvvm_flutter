import 'package:flutter/material.dart';
import 'package:mvvm_practice/resources/constants/app_urls.constants.resources.dart';
import 'package:mvvm_practice/utils/routes/app_routes.routes.utils.dart';
import 'package:mvvm_practice/utils/routes/routes_name.routes.utils.dart';
import 'package:mvvm_practice/view_model/User/user_viewmodel.user.view_model.dart';
import 'package:mvvm_practice/view_model/auth/auth.view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: MaterialApp(
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
      ),
    );
  }
}
