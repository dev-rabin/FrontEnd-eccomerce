import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api.dart';
import 'package:ecommerce_app/data/models/user/user_model.dart';

final _api = API();

class UserRepository {
  Future<UserModel> createAccount(
      {required String email, required String password}) async {
    try {
      //Request sending
      Response response = await _api.sendRequest.post("/user/createAccount",
          data: jsonEncode({"email": email, "password": password}));
      // Api response
      ApiResponse apiResponse = ApiResponse.fromResponse(response);
      // checking success of api response
      if (apiResponse.success) {
        throw apiResponse.message.toString();
      }
      //Convert rat data to model
      return UserModel.fromJson(apiResponse.data);
    } catch (error) {
      rethrow;
    }
  }

  Future<UserModel> signIn(
      {required String email, required String password}) async {
    try {
      Response response = await _api.sendRequest.post("/user/signin",
          data: jsonEncode({"email": email, "password": password}));

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (apiResponse.success) {
        throw apiResponse.message.toString();
      }
      return UserModel.fromJson(apiResponse.data);
    } catch (error) {
      rethrow;
    }
  }
}
