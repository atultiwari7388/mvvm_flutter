import 'package:mvvm_practice/data/exceptions/app.exceptions.data.dart';

class BadRequestExceptions extends AppExceptions {
  BadRequestExceptions([String? message]) : super(message, "Invalid Request");
}
