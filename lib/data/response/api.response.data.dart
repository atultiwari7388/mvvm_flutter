import 'package:mvvm_practice/data/response/status.response.data.dart';

class ApiResponse<T> {
  ApiStatus? apiStatus;
  T? data;
  String? message;

  ApiResponse(this.apiStatus, this.data, this.message);

  ApiResponse.loading() : apiStatus = ApiStatus.loading;
  ApiResponse.success(this.data) : apiStatus = ApiStatus.success;
  ApiResponse.error(this.message) : apiStatus = ApiStatus.error;

  @override
  String toString() {
    return "ApiStatus : $apiStatus \n  Message : $message\n Data : $data";
  }
}
