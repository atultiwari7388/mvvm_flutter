import 'package:mvvm_practice/data/exceptions/app.exceptions.data.dart';

class UnauthorisedException extends AppExceptions {
  UnauthorisedException([String? message])
      : super(message, "Unauthorised Request");
}
