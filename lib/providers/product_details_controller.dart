import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:simple_products/models/product_details.dart';

class ProductDetailsController extends ChangeNotifier {
  ProductDetails? detail;

//++++++++++++++++++++++++++++++++++++++++++
  getDetails(int id) async {
    try {
      var response = await Dio().get(
        'https://thefanss.com/api/v2/products/$id',
      );
      Map<String, dynamic> mapProduct = response.data as Map<String, dynamic>;

      Map<String, dynamic> detailsMap =
          mapProduct['data'][0] as Map<String, dynamic>;

      detail = ProductDetails.fromMap(detailsMap);
      print(detail!.thumbnail_image);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
