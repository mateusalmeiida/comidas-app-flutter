import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [category.color.withValues(alpha: 0.6), category.color])),
      child: Center(
          child: Text(
        category.title,
        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      )),
    );
  }
}
