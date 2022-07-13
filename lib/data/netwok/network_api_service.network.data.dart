import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:mvvm_practice/data/exceptions/bad_request.exceptions.data.dart';
import 'package:mvvm_practice/data/exceptions/fetch_data.exceptions.data.dart';
import 'package:mvvm_practice/data/exceptions/unauthorized.exceptions.data.dart';
import 'package:mvvm_practice/data/netwok/base_api_service.network.data.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = httpReturnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await post(
        Uri.parse(url),
        body: data,
      ).timeout(const Duration(seconds: 10));
      responseJson = httpReturnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  dynamic httpReturnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestExceptions(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            "Error occurred while communicating with server${response.statusCode.toString()} ${response.body.toString()}");
    }
  }
}
