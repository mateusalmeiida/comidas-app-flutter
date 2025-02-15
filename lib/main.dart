import 'package:comidas/screens/categories_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MealApp());
}

class MealApp extends StatelessWidget {
  const MealApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MealApp',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              primary: Colors.deepOrange,
              onPrimary: Colors.white,
              seedColor: Colors.white)),
      home: CategoriesScreen(),
    );
  }
}
