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
          textTheme: TextTheme(
              bodySmall: TextStyle(fontFamily: 'Raleway'),
              titleSmall: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: MediaQuery.of(context).textScaler.scale(18),
                  fontFamily: 'RobotoCondensed')),
          colorScheme: ColorScheme.fromSeed(
              primary: Colors.pink,
              onPrimary: Colors.white,
              seedColor: Colors.amber)),
      home: CategoriesScreen(),
    );
  }
}
