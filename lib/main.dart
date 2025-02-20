import 'package:flutter/material.dart';
import './screens/categories_meals_screen.dart';
import 'utils/app_routes.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/settings_screen.dart';
import './models/meal.dart';
import './data/dummy_data.dart';
import './models/settings.dart';

void main() {
  runApp(MealApp());
}

class MealApp extends StatefulWidget {
  const MealApp({super.key});

  @override
  State<MealApp> createState() => _MealAppState();
}

class _MealAppState extends State<MealApp> {
  List<Meal> _availableMeals = dummyMeals;
  final List<Meal> _favoriteMeals = [];
  Settings settings = Settings();

  void _filterMeals(Settings settings) {
    setState(() {
      _availableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        final filterVegan = settings.isVegan && !meal.isVegan;

        return !(filterGluten ||
            filterLactose ||
            filterVegetarian ||
            filterVegan);
      }).toList();
    });
  }

  void _toogleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MealApp',
      theme: ThemeData(
        textTheme: TextTheme(
          bodySmall: TextStyle(fontFamily: 'Raleway'),
          titleSmall: TextStyle(
              color: Colors.black,
              fontSize: MediaQuery.of(context).textScaler.scale(22),
              fontFamily: 'RobotoCondensed'),
          titleMedium: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: MediaQuery.of(context).textScaler.scale(20),
              fontFamily: 'RobotoCondensed'),
        ),
        colorScheme: ColorScheme.fromSeed(
            primary: Colors.pink,
            onPrimary: Colors.white,
            secondary: Colors.amber,
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
          return TabsScreen(
            favoriteMeals: _favoriteMeals,
          );
        },
        AppRoutes.CATEGORIES_MEALS: (ctx) {
          return CategoriesMealsScreen(meals: _availableMeals);
        },
        AppRoutes.MEAL_DETAIL: (ctx) {
          return MealDetailScreen(
            isFavoriteFunction: isFavorite,
            toogleFavorite: _toogleFavorite,
          );
        },
        AppRoutes.SETTINGS: (ctx) {
          return SettingsScreen(
            settings: settings,
            onSettingsChanged: _filterMeals,
          );
        }
      },
    );
  }
}
