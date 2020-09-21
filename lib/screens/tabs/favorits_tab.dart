import 'package:flutter/material.dart';

import '../../widgets/meals_grid.dart';
import '../../models/meal.dart';

class FavoritsTab extends StatelessWidget {
  final List<Meal> _favorites;

  FavoritsTab(this._favorites);
  @override
  Widget build(BuildContext context) {
    return MealsGrid(_favorites);
  }
}
