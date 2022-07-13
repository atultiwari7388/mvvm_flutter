import 'package:mvvm_practice/data/exceptions/app.exceptions.data.dart';

class InvalidInputExceptions extends AppExceptions {
  InvalidInputExceptions([String? message]) : super(message, "Invalid Input");
}
