import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodelo/core/core.dart';
import 'package:foodelo/data/models/cart_model.dart';
import 'package:foodelo/data/models/product_model.dart';
import 'package:foodelo/data/models/user_auth_model.dart';
import 'package:http/http.dart' as http;

class CartProvider extends ChangeNotifier {
  final userAuth = UserAuth();
  ProductModel? productModel;
  CartModel? cartModel;

  Future<ProductModel> viewAllProduct() async {
    try {
      http.Response response = await http.get(
        Uri.parse("${ApiPath().baseUrl}user/${userAuth.getUserId}/products"),
        headers: {
          'Authorization': 'Bearer ${userAuth.getUserToken}',
        },
      );

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

  Future<CartModel> addCart(
      {String? userId, String? productId, String? quantity}) async {
    try {
      final map = {
        "userId": userId,
        "productId": productId,
        "quantity": quantity
      };

      http.Response response = await http.post(
        Uri.parse(ApiPath().baseUrl + ApiPath().cartApi.addCart),
        body: map,
        headers: {
          'Authorization': 'Bearer ${userAuth.getUserToken}',
        },
      );
      cartModel = CartModel.fromJson(
        jsonDecode(response.body),
      );
      print(' ---------------------- Add Cart ---------------------- ');
      print(response.body);
      print(' -------------------------------------------- ');
      return cartModel!;
    } catch (e) {
      print(e);
      return CartModel(
        success: false,
        message: "$e",
      );
    }
  }

  Future<CartModel> viewAppCart() async {
    try {
      http.Response response = await http.get(
        Uri.parse("${ApiPath().baseUrl}user/${userAuth.getUserId}/cart"),
        headers: {
          'Authorization': 'Bearer ${userAuth.getUserToken}',
        },
      );

      cartModel = CartModel.fromJson(jsonDecode(response.body));
      print(' ---------------------- View All Cart ---------------------- ');
      print(response.body);
      print(' -------------------------------------------- ');
      return cartModel!;
    } catch (e) {
      print(e);
      return CartModel(
        success: false,
        message: "$e",
      );
    }
  }
}
