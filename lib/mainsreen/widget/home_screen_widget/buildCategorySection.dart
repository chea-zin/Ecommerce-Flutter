import 'package:flutter/material.dart';
import '../../allsreen/category/electronics.dart';
import '../../allsreen/category/fashion.dart';
import '../../allsreen/category/furniture.dart';
import '../../allsreen/category/industrail.dart';
import 'buildProductsSectionHeader.dart';
import 'build_category_items.dart';

Widget buildCategorySection(BuildContext context) {
  return Column(
    children: [
      buildProductSectionHeader('Categories', context),
      SizedBox(
        height: 100, // Adjust height as needed
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              buildCategoryItem(
                context,
                icon: '📱',
                label: 'Electronics',
                onTap: () =>
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Electronics())),
              ),
              buildCategoryItem(
                context,
                icon: '🪑',
                label: 'Chair',
                onTap: () =>
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Fashion())),
              ),
              buildCategoryItem(
                context,
                icon: '🛋️',
                label: 'Sofa',
                onTap: () =>
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Furniture())),
              ),

            ],
          ),
        ),
      ),
    ],
  );
}