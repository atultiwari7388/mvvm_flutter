import 'package:mvvm_practice/data/netwok/base_api_service.network.data.dart';
import 'package:mvvm_practice/data/netwok/network_api_service.network.data.dart';
import 'package:mvvm_practice/resources/constants/app_urls.constants.resources.dart';

class AuthRepository {
  //import base api services and initialize with networkApiService
  final BaseApiServices _apiServices = NetworkApiServices();

  //login function

  Future<dynamic> userLogin(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppConstants.loginUser, data);
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

//register function

  Future<dynamic> userRegister(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppConstants.loginUser, data);
      return response;
    } catch (e) {
      throw e.toString();
    }
  }
}
