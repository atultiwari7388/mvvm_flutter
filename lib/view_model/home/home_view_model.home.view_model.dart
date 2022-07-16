import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_practice/data/response/api.response.data.dart';
import 'package:mvvm_practice/models/ListOfUsers.model.dart';
import 'package:mvvm_practice/repository/home/home_repo.home.repository.dart';

class HomeViewModel with ChangeNotifier {
  final _homeRepo = HomeRepository();

  ApiResponse<ListOfUsers> userResponse = ApiResponse.loading();

  setUserList(ApiResponse<ListOfUsers> response) {
    userResponse = response;
    notifyListeners();
  }

  Future<void> fetchUsersListData() async {
    setUserList(ApiResponse.loading());
    _homeRepo.getUsersDataLists().then((value) {
      setUserList(ApiResponse.success(value));
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setUserList(ApiResponse.error(error.toString()));
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
