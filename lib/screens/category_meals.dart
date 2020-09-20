import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoryMeals extends StatelessWidget {
  static const String route = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final route =
        ModalRoute.of(context).settings.arguments as Map<String, Category>;
    final category = route['category'];
    return Scaffold(
        appBar: AppBar(
          title: Text(category.title),
          backgroundColor: category.color,
        ),
        body: Center(
            child: Text(
          'Navigator now works!!\n${category.title}',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline1,
        )));
  }
}
