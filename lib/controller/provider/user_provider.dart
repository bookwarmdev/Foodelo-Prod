import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodelo/core/core.dart';
import 'package:foodelo/data/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  UserModel? userModel;

  Future<UserModel> singUp(
      {String? name, String? email, String? password}) async {
    try {
      final map = {'name': name, 'email': email, 'password': password};
      http.Response response = await http.post(
        Uri.parse(ApiPath().baseUrl + ApiPath().authAPi.register),
        body: map,
      );

      userModel = UserModel.fromJson(jsonDecode(response.body));
      notifyListeners();
      print(' ---------------------- Register User ---------------------- ');
      print(response.body);
      print(' -------------------------------------------- ');
      return userModel!;
    } catch (e) {
      print(' ---------------------- Register Error ---------------------- ');
      print(e);
      print(' -------------------------------------------- ');
      return UserModel(success: false, message: "$e");
    }
  }

  Future<UserModel> verifyOtp({String? email, String? otp}) async {
    try {
      final map = {'email': email, 'otp': otp};

      http.Response response = await http.post(
        Uri.parse(ApiPath().baseUrl + ApiPath().authAPi.verifyOtp),
        body: map,
      );
      userModel = UserModel.fromJson(jsonDecode(response.body));
      notifyListeners();
      print(' ----------------------  Verify OTP ---------------------- ');
      print(response.body);
      print(' -------------------------------------------- ');

      return userModel!;
    } catch (e) {
      print(' ---------------------- Verify OTP Error ---------------------- ');
      print(e);
      print(' -------------------------------------------- ');
      return UserModel(success: false, message: "$e");
    }
  }

  Future<UserModel> singIn({String? email, String? password}) async {
    try {
      final map = {'email': email, 'password': password};
      http.Response response = await http.post(
        Uri.parse(ApiPath().baseUrl + ApiPath().authAPi.signIn),
        body: map,
      );

      userModel = UserModel.fromJson(
        jsonDecode(response.body),
      );

      notifyListeners();
      print(' ----------------------  Login details ---------------------- ');
      print(response.body);
      print(' -------------------------------------------- ');
      return userModel!;
    } catch (e) {
      print(' ---------------------- Login Error ---------------------- ');
      print(e);
      print(' -------------------------------------------- ');
      return UserModel(success: false, message: "$e");
    }
  }
}
