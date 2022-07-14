import 'package:flutter/material.dart';
import 'package:mvvm_practice/utils/routes/app_routes.routes.utils.dart';
import 'package:mvvm_practice/utils/routes/routes_name.routes.utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVVM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutesName.login,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
    );
  }
}
