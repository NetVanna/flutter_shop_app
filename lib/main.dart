import 'package:ecommerce_ui/page/main_screen.dart';
import 'package:ecommerce_ui/provider/cart_provider.dart';
import 'package:ecommerce_ui/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> FavoriteProvider()),
        ChangeNotifierProvider(create: (context)=> CartProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}
