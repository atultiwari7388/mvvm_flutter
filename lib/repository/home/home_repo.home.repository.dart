import 'package:mvvm_practice/data/netwok/base_api_service.network.data.dart';
import 'package:mvvm_practice/data/netwok/network_api_service.network.data.dart';
import 'package:mvvm_practice/models/ListOfUsers.model.dart';
import 'package:mvvm_practice/resources/constants/app_urls.constants.resources.dart';

class HomeRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  //fetch user data list
  Future<ListOfUsers> getUsersDataLists() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppConstants.homeDataUrls);
      return response = ListOfUsers.fromJson(response);
    } catch (e) {
      throw e.toString();
    }
  }
}
