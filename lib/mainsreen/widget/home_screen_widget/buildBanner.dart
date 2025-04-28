import 'package:flutter/material.dart';

Widget buildBanner(Size size) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Container(
      height: size.height * 0.2,
      width: size.width * 0.95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
            image: AssetImage('assets/banner.png'),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}