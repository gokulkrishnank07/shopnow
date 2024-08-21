import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shopnow/model/productmodel.dart';

class Productservice {
  var message;
  Productmodel? productmodel;
  Future<bool> addproduct(
      Productmodel? productmodel, BuildContext context) async {
    try {
      final response = await Dio().post(
        "https://fakestoreapi.com/products",
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
        data: jsonEncode({
          'title': productmodel?.title,
          'description': productmodel?.description,
          'price': productmodel?.price,
          'category': productmodel?.category,
        }),
      );
      if (response.statusCode == 200) {
        print(response.data);
        return true;
      } else {
        print("failed......${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
    return false;
  }
}
