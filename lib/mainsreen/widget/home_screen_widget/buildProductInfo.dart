import 'package:ecommerce_rupp/models/products.dart';
import 'package:flutter/material.dart';

Widget buildProductInfo(Product product) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(product.title,
            style: TextStyle(fontSize: 18), overflow: TextOverflow.ellipsis),
      ),
      const SizedBox(height: 30),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text("\$${product.price}",
            style: TextStyle(
                fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis),
      ),
    ],
  );
}
