import 'package:ecommerce_rupp/controller/mycart_controller.dart';
import 'package:ecommerce_rupp/mainsreen/allsreen/category/bottomnavigationbar.dart';
import 'package:ecommerce_rupp/mainsreen/allsreen/checkout/checkout_payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(MyCartController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: CustomPageTransition(),
            TargetPlatform.android: CustomPageTransition(),
          },
        ),
        navigationBarTheme: NavigationBarThemeData(
          indicatorColor: Colors.transparent,
          backgroundColor: Colors.white,
          overlayColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
      home: NavigationBarApp(),
      getPages: [
        GetPage(name: '/checkout', page: () => CheckoutPayment()),
      ],
    );
  }
}
class CustomPageTransition extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    // Use a slide transition for smooth horizontal animation
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0), // Slide in from the right
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut, // Use a smooth easing curve
      )),
      child: child,
    );
  }
}
