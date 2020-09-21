import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meals_grid.dart';
import '../models/category.dart';

class CategoryMeals extends StatelessWidget {
  static const String route = '/category-meals';

  final List<Meal> _filteredMeals;

  CategoryMeals(this._filteredMeals);

  @override
  Widget build(BuildContext context) {
    final route =
        ModalRoute.of(context).settings.arguments as Map<String, Category>;
    final category = route['category'];
    final meals = _filteredMeals
        .where(
          (element) => element.categories.contains(category.id),
        )
        .toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(category.title),
          backgroundColor: category.color,
        ),
        body: MealsGrid(meals));
  }
}
