import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppMessages {
  //toast msg
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  //Error Message
  static void errorMessage(BuildContext context, String message) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.bounceIn,
        reverseAnimationCurve: Curves.easeInBack,
        icon: const Icon(Icons.error, color: Colors.white),
        margin: const EdgeInsets.all(8.0),
        message: message,
        backgroundColor: Colors.red,
        borderRadius: BorderRadius.circular(10),
        positionOffset: 20,
        flushbarPosition: FlushbarPosition.TOP,
        duration: const Duration(seconds: 3),
      )..show(context),
    );
  }

  //Success Message
  static void successMessage(BuildContext context, String message) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.bounceIn,
        reverseAnimationCurve: Curves.easeInBack,
        icon: const Icon(Icons.done, color: Colors.white),
        margin: const EdgeInsets.all(8.0),
        message: message,
        backgroundColor: Colors.green,
        borderRadius: BorderRadius.circular(10),
        positionOffset: 20,
        flushbarPosition: FlushbarPosition.TOP,
        duration: const Duration(seconds: 3),
      )..show(context),
    );
  }
}
