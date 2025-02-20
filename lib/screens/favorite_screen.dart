import 'package:comidas/components/meal_item.dart';
import 'package:comidas/models/meal.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoriteScreen({required this.favoriteMeals, super.key});

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text(
          'Você não tem Refeições favoritas',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      );
    } else {
      return ListView.builder(
          itemCount: favoriteMeals.length,
          itemBuilder: (ctx, index) {
            return MealItem(meal: favoriteMeals[index]);
          });
    }
  }
}
