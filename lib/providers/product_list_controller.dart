import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:simple_products/models/product.dart';

class ProductListController extends ChangeNotifier {
  List<Product> productList = [];

  //
  getProducts() async {
    try {
      var response = await Dio().get(
        'https://thefanss.com/api/v2/products',
      );

      Map<String, dynamic> mapProduct = response.data as Map<String, dynamic>;
      productList = (mapProduct['data'] as Iterable)
          .map(
            (map) => Product.fromMap(map),
          )
          .toList();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
