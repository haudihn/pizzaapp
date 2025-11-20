import 'package:flutter/material.dart';
import 'package:pizza_app/pages/cart_page.dart';
import 'package:pizza_app/pages/home_page.dart';
import 'package:pizza_app/pages/splash_page.dart';
import 'package:provider/provider.dart';
import 'package:pizza_app/models/shop.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const PizzaApp(
    ),
  ));
}

class PizzaApp extends StatelessWidget {
  const PizzaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        colorSchemeSeed: const Color.fromARGB(255, 255, 34, 34),
        useMaterial3: true,
      ),
      home: const SplashPage(),
      routes: {
        '/splash': (context) => const SplashPage(),
        '/homepage': (context) => const HomePage(),
        '/cartpage': (context) => const CartPage(),
      },
    );
  }
}
