import 'dart:convert';
import 'package:ecommerce_rupp/mainsreen/widget/home_screen_widget/buildLastProductsSection.dart';
import 'package:http/http.dart' as http;

import '../models/products.dart';

class ApiService {
  // Fetch all products from the fake API
  Future<List<Product>> fetchAllProducts() async {
    final String url = 'http://127.0.0.1:8000/api/products';  // Endpoint for all products

    // Make the HTTP request
    final response = await http.get(Uri.parse(url));

    // Check if the request was successful (HTTP 200)
    if (response.statusCode == 200) {
      // Parse the JSON response into a list of product data
      List<dynamic> data = json.decode(response.body);

      // Map the product data into a list of product information (name, price, and discount)
      return data.map((product) {
        return Product(
            id: product['_id'].toString(),
            title: product['name'].toString(),
            image: product['image_url'].toString(),
            price: product['price'].toString(),

        );
      }).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
