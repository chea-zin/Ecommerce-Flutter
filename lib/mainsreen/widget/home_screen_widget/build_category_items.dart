import 'package:flutter/material.dart';

Widget buildCategoryItem(BuildContext context, {required String icon, required String label, required VoidCallback onTap}) {
  return Padding(
    padding: EdgeInsets.all(4),
    child: InkWell(
      onTap: onTap,
      child: Container(
        height: 80, // Fixed height to avoid overflow
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              spreadRadius: 0,
              blurRadius: 1,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(icon, style: TextStyle(fontSize: 30)),
            SizedBox(height: 5), // Avoids text being too close
            Text(
              label,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}