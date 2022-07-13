import 'package:mvvm_practice/data/exceptions/app.exceptions.data.dart';

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, "Error During Communication");
}
