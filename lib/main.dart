import 'package:comidas/screens/categories_screen.dart';
import 'package:flutter/material.dart';
import './screens/categories_meals_screen.dart';
import 'utils/app_routes.dart';
import './screens/meal_detail_screen.dart';

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
              fontSize: MediaQuery.of(context).textScaler.scale(20),
              fontFamily: 'RobotoCondensed'),
        ),
        colorScheme: ColorScheme.fromSeed(
            primary: Colors.pink,
            onPrimary: Colors.white,
            seedColor: Colors.amber),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white,
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontFamily: 'Raleway',
              fontSize: MediaQuery.of(context).textScaler.scale(18),
              fontWeight: FontWeight.w700),
        ),
      ),
      routes: {
        AppRoutes.HOME: (ctx) {
          return CategoriesScreen();
        },
        AppRoutes.CATEGORIES_MEALS: (ctx) {
          return CategoriesMealsScreen();
        },
        AppRoutes.MEAL_DETAIL: (ctx) {
          return MealDetailScreen();
        }
      },
    );
  }
}
