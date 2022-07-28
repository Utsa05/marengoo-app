import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marengoo/constants/api_core.dart';
import 'package:marengoo/models/product_model.dart';

class ApiService {

  Future<List<ProductModel>> fetchProducts(String path) async {
    var response = await http.get(Uri.parse("${ApiCore.baseUrl}$path"));

    if (response.statusCode == 200) {
      
      return  productModelFromJson(response.body);
    } else {
      return [];
    }
  }
}
