import 'package:flutter/material.dart';

import 'buildProfileImage.dart';

Widget buildHeader(size) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          height: size.height * 0.05,
          width: size.width * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage('assets/logo.png'),
              // Adjusted for your project structure
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(Icons.search, size: 40),
            SizedBox(width: 10),
            buildProfileImage(size),
          ],
        ),
      ),
    ],
  );
}