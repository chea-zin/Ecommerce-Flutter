import 'package:flutter/material.dart';
import '../widget/home_screen_widget/buildBanner.dart';
import '../widget/home_screen_widget/buildCategorySection.dart';
import '../widget/home_screen_widget/buildHeader.dart';
import '../widget/home_screen_widget/buildLastProductsSection.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Color(0xfff0f1f1),
      body: SafeArea(
        child: ListView(
          children: [
            buildHeader(size),
            buildBanner(size),
            buildCategorySection(context),
            ProductsSection()
          ],
        ),
      ),
    );
  }
}