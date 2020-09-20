import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/category.dart';
import '../data/dummy_data.dart';

class CategoryMeals extends StatelessWidget {
  static const String route = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final route =
        ModalRoute.of(context).settings.arguments as Map<String, Category>;
    final category = route['category'];
    final meals = DUMMY_MEALS
        .where(
          (element) => element.categories.contains(category.id),
        )
        .toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(category.title),
          backgroundColor: category.color,
        ),
        body: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 500,
            childAspectRatio: 1.5 / 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          padding: const EdgeInsets.all(25),
          children: meals.map((e) => MealItem(e)).toList(),
        ));
  }
}
