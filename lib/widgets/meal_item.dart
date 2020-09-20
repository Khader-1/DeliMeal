import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/category_meals.dart';

class MealItem extends StatelessWidget {
  final Meal _meal;

  MealItem(this._meal);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          CategoryMeals.route,
          arguments: {
            'category': _meal,
          },
        );
      },
      borderRadius: BorderRadius.circular(15),
      // splashColor: Theme.of(context).primaryColor,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(4),
        child: Stack(
          children: [
            ClipRRect(
              child: Image.network(
                _meal.imageUrl,
                // height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(15),
                  topRight: const Radius.circular(15)),
            )
          ],
        ),
      ),
    );
  }
}
