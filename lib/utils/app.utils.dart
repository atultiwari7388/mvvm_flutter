import 'package:flutter/cupertino.dart';

class AppUtils {
  //focus node
  static void fieldFocusChange(
    BuildContext context,
    FocusNode currentFocusNode,
    FocusNode nextFocusNode,
  ) {
    currentFocusNode.unfocus();
    FocusScope.of(context).requestFocus(nextFocusNode);
  }
}
