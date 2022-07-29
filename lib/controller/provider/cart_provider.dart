import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodelo/core/core.dart';
import 'package:foodelo/data/models/product_model.dart';
import 'package:foodelo/data/models/user_model.dart';
import 'package:http/http.dart' as http;

class CartProvider extends ChangeNotifier {
  UserModel? userAuth;
  ProductModel? productModel;

  Future<ProductModel> viewAllProduct() async {
    try {
      http.Response response = await http.get(
          Uri.parse(
              "${ApiPath().baseUrl}user/62e391c8d80f954932309c18/products"),
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2MmUzOTFjOGQ4MGY5NTQ5MzIzMDljMTgiLCJpYXQiOjE2NTkwODQxODcsImV4cCI6MTY1OTE3MDU4N30.rFhj_RcfzYmqFqHUpyguInbI7JOy9pNaAXZgoZttGCc',
          });

      productModel = ProductModel.fromJson(
        jsonDecode(response.body),
      );

      notifyListeners();
      print(' ---------------------- List All Product ---------------------- ');
      print(response.body);
      print(' -------------------------------------------- ');
      return productModel!;
    } catch (e) {
      print(e);
      return ProductModel(success: false, message: "$e");
    }
  }

  Future<Map<String, dynamic>> addCart(
      {String? userId, String? productId, String? quantity}) async {
    try {
      http.Response _response = await http.post(
        Uri.parse(ApiPath().baseUrl + ApiPath().cartApi.addCart),
        body: {
          'userId': userId,
          'productId': productId,
          'quantity': quantity,
        },
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2MmUzOTFjOGQ4MGY5NTQ5MzIzMDljMTgiLCJpYXQiOjE2NTkwODQxODcsImV4cCI6MTY1OTE3MDU4N30.rFhj_RcfzYmqFqHUpyguInbI7JOy9pNaAXZgoZttGCc',
        },
      );
      print(' ---------------------- Request OTP Code ---------------------- ');
      print(_response.body);
      print(' -------------------------------------------- ');
      return jsonDecode(_response.body);
    } catch (e) {
      return {
        'status': 'fail',
        'message': '$e',
      };
    }
  }
}
