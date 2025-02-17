import 'package:comidas/models/meal.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Ingredientes',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Container(
                width: 300,
                height: 250,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: ListView.builder(
                    itemCount: meal.ingredients.length,
                    itemBuilder: (ctx, index) {
                      return Card(
                        shape: LinearBorder(),
                        color: Theme.of(context).colorScheme.secondary,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                            meal.ingredients[index],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Raleway'),
                          ),
                        ),
                      );
                    }))
          ],
        ));
  }
}
