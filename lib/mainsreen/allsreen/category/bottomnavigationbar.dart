import 'package:ecommerce_rupp/mainsreen/allsreen/categories.dart';
import 'package:ecommerce_rupp/mainsreen/allsreen/homesreen.dart';
import 'package:ecommerce_rupp/mainsreen/allsreen/mycart_screen/mycart.dart';
import 'package:ecommerce_rupp/mainsreen/allsreen/profile/protilepage.dart';
import 'package:ecommerce_rupp/mainsreen/allsreen/wishlist_screen/wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const NavigationExample();
  }
}

class NavigationController extends GetxController{
  final RxInt currentPageIndex = 0.obs;
  final PageController pageController = PageController();

  void onPageChanged(int index) => currentPageIndex.value = index;
  void onNavItemTapped(int index) => pageController.jumpToPage(index);
}
//navigationExample
class NavigationExample extends StatelessWidget {
  const NavigationExample({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(() => NavigationBar(
       onDestinationSelected: controller.onNavItemTapped,
        backgroundColor: Colors.white,
        selectedIndex: controller.currentPageIndex.value,
        destinations: <Widget>[
          const NavigationDestination(
            selectedIcon: Icon(Icons.home, color:  Color(0xFF897662), size: 40,),
            icon: Icon(Icons.home_outlined, size: 30,),
            label: 'Home',
          ),
          const NavigationDestination(
            selectedIcon: Icon(Icons.category, color: Color(0xFF897662), size: 40),
            icon: Icon(Icons.category_outlined, size: 30),
            label: 'Categories',
          ),
          NavigationDestination(
            selectedIcon: Transform.translate(
              offset: Offset(0, -10), // Adjust the vertical offset (negative value moves it up)
              child: Icon(Icons.local_mall, color: Color(0xFF897662), size: 60),
            ),
            icon: Transform.translate(
              offset: Offset(0, -10), // Adjust the vertical offset (negative value moves it up)
              child: Icon(Icons.local_mall, size: 60),
            ),
            label: '',
          ),
          const NavigationDestination(
            selectedIcon: Icon(Icons.favorite, color: Color(0xFF897662), size: 40),
            icon: Icon(Icons.favorite_border, size: 30),
            label: 'Wishlist',
          ),
          const NavigationDestination(
            selectedIcon: Icon(Icons.person_outline, color: Color(0xFF897662), size: 40),
            icon: Icon(Icons.person_outline, size: 30),
            label: 'Profile',
          ),
        ],
      )),
      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        physics: const BouncingScrollPhysics(), //Smooth bouncing effects
        children: [
          const Homescreen(),
          const Categories(),
          Mycarts(
            onNavigateToCategories: () {
              controller.onNavItemTapped(1); // Navigate to the Categories screen (index 1)
            },
          ),
          WishlistPage(),
          ProfilePage()
        ],
      ),
    );
  }
}

