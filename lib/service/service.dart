
import 'package:collabrademo/common/api.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/productData.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    final url = Uri.parse('$baseUrl/products');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      _products = data.map((item) => Product.fromJson(item)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load products');
    }
  }
}