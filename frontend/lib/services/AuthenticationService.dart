import 'dart:convert';
import 'dart:io';
import 'package:flutter_catalog/services/AbstractServices/AbstractCategoryService.dart';
import 'package:flutter_session/flutter_session.dart';
import "package:http/http.dart" as http;
import '../models/category.dart';
import '../models/session.dart';
import '../models/token.dart';
import '../models/user.dart';
import 'AbstractServices/AbstractAuthenticationService.dart';

class AuthenticationService extends AbstractAuthenticationService {
  @override
  Future<bool> register(UserRegisterModel userRegisterModel) async {
    try {
      var userRegisterResponse = await client.post(
          Uri.parse(isPc ? pcUrl : laptopUrl + "/api/user/register"),
          headers: headers,
          body: jsonEncode(<String, String>{
            'email': userRegisterModel.email,
            'password': userRegisterModel.password
          }));

      var decodedData = jsonDecode(userRegisterResponse.body);
      print(decodedData);
      return true;
    } on SocketException {
      print("No internet connection.");
      return false;
    }
  }

  Future<UserResponseModel?> login(UserLoginModel userLoginModel) async {
    try {
      var userLoginResponse = await client.post(
          Uri.parse(isPc ? pcUrl : laptopUrl + "/api/user/login"),
          headers: headers,
          body: jsonEncode(<String, String>{
            'email': userLoginModel.email,
            'password': userLoginModel.password
          }));

      var decodedData = jsonDecode(userLoginResponse.body)["result"];
      return UserResponseModel.toJson(decodedData);
    } on SocketException {
      print("No internet connection.");
      return null;
    }
  }

  Future<void> regenerateToken() async {
    var userModel = await FlutterSession().get(session().userModel);
    var userModelJson = UserResponseModel.toJson(userModel);

    var response = await client.post(
        Uri.parse(isPc ? pcUrl : laptopUrl + "/api/user/refresh"),
        body: jsonEncode(<String, String>{
          'accessToken': userModelJson.accessToken,
          'refreshToken': userModelJson.refreshToken
        }));

    if (response.statusCode == 200) {
      // TODO: Fix this being called for all API's
      var decodedData = jsonDecode(response.body)["result"];
      userModelJson.accessToken = decodedData["token"].toString();
      userModelJson.refreshToken = decodedData["refreshToken"].toString();
      print("NEW TOKEN: " + userModelJson.accessToken);
      await FlutterSession().set(session().userModel, userModelJson);
    }
  }
}
