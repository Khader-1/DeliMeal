import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoryMeals extends StatelessWidget {
  final Category _category;

  CategoryMeals(this._category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Category Meals'),
        ),
        body: Center(
            child: Text(
          'Navigator now works!!\n${_category.title}',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline1,
        )));
  }
}
