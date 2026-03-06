import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductService {
  static Future<List<Product>> fetchProducts() async {
    final response =
        await http.get(Uri.parse("https://wantapi.com/products.php"));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData =
          json.decode(response.body);

      final List<dynamic> productList = jsonData["data"];

      return productList
          .map((item) => Product.fromJson(item))
          .toList();
    } else {
      throw Exception("Ürünler yüklenemedi");
    }
  }
}