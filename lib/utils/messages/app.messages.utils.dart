import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppMessages {
  //toast msg
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  //flushBar Message
  static void flushBarMessage(
      BuildContext context, String message, Color color, IconData icon) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.bounceIn,
        reverseAnimationCurve: Curves.easeInBack,
        icon: Icon(icon, color: Colors.white),
        margin: const EdgeInsets.all(8.0),
        message: message,
        backgroundColor: color,
        borderRadius: BorderRadius.circular(10),
        positionOffset: 20,
        flushbarPosition: FlushbarPosition.TOP,
        duration: const Duration(microseconds: 1000),
      )..show(context),
    );
  }
}
