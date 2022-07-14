import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_practice/utils/messages/app.messages.utils.dart';
import 'package:mvvm_practice/view_model/auth/auth.view_model.dart';
import 'package:provider/provider.dart';
import '../../resources/components/round_button.components.resources.dart';
import '../../utils/app.utils.dart';
import '../../utils/routes/routes_name.routes.utils.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _obsecurePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                onFieldSubmitted: (value) {
                  AppUtils.fieldFocusChange(
                    context,
                    emailFocusNode,
                    passwordFocusNode,
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (BuildContext context, dynamic value, Widget? child) {
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: _obsecurePassword.value,
                    obscuringCharacter: '*',
                    focusNode: passwordFocusNode,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: 'password',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: () {
                          _obsecurePassword.value = !_obsecurePassword.value;
                        },
                        child: Icon(
                          _obsecurePassword.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 50.0),
              RoundButton(
                text: "Register",
                loading: authViewModel.loading,
                onPressed: () {
                  if (_emailController.text.isEmpty &&
                      _passwordController.text.isEmpty) {
                    AppMessages.flushBarMessage(
                        context,
                        "Please enter email and password",
                        Colors.red,
                        Icons.error);
                  } else if (_passwordController.text.length < 6) {
                    AppMessages.flushBarMessage(
                        context,
                        "Password must be 6 characters",
                        Colors.red,
                        Icons.error);
                  } else {
                    Map data = {
                      "email": _emailController.text.toString(),
                      "password": _passwordController.text.toString(),
                    };
                    authViewModel.registerUser(data, context);
                    if (kDebugMode) {
                      print("hit api");
                    }
                  }
                },
              ),
              const SizedBox(height: 50.0),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, RoutesName.login),
                child: RichText(
                  text: const TextSpan(
                    text: "Already have an account ? ",
                    style: TextStyle(color: Colors.black, fontSize: 17.0),
                    children: [
                      TextSpan(
                        text: "Login ",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15.0,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
