import 'package:flutter/material.dart';

import './meal_item.dart';
import '../models/meal.dart';

class MealsGrid extends StatelessWidget {
  final List<Meal> _meals;
  MealsGrid(this._meals);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 500,
        childAspectRatio: 1 / 1,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      padding: const EdgeInsets.all(25),
      children: _meals.map((e) => MealItem(e)).toList(),
    );
  }
}
