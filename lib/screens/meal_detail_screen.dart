import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Refeição'),
      ),
      body: Center(
        child: Text('Detalhes da Refeição'),
      ),
    );
  }
}
