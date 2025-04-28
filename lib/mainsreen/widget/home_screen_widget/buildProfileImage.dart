import 'package:flutter/material.dart';

Widget buildProfileImage(Size size) {
  return Container(
    height: size.height * 0.07,
    width: size.width * 0.15,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 1)],
      borderRadius: BorderRadius.circular(15),
      image: DecorationImage(
        image: NetworkImage(
            'https://cdn-icons-png.flaticon.com/256/15197/15197100.png'),
        fit: BoxFit.cover,
      ),
    ),
  );
}