import 'package:flutter/material.dart';

Widget buildCategoryItem(BuildContext context, {required String icon, required String label, required VoidCallback onTap}) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: InkWell(
      onTap: onTap,
      child: Container(
        height: 50, // Fixed height to avoid overflow
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
             color: Colors.grey.withOpacity(0.2), blurRadius: 10
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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