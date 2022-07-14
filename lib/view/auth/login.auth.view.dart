import 'package:flutter/material.dart';
import 'package:mvvm_practice/utils/messages/app.messages.utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("Login Screen"),
          ),
          const SizedBox(height: 40),
          InkWell(
            onTap: () => AppMessages.toastMessage("message"),
            child: const Center(
              child: Text("Go to home Page"),
            ),
          ),
        ],
      ),
    );
  }
}
