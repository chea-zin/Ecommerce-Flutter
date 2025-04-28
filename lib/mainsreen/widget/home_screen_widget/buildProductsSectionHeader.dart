import 'package:flutter/material.dart';

Widget buildProductSectionHeader(String title, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.all(15),
        child: Text(title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
      ),
      /*Padding(
        padding: const EdgeInsets.all(15),
        child: InkWell(
          onTap: () {},
          child: Text('SELL ALL', style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF964B00))),
        ),
      ),*/
    ],
  );
}