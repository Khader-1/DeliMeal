import 'dart:math';

import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetails extends StatelessWidget {
  static const String route = '/meal-details';

  final Function _setFavorite;

  MealDetails(this._setFavorite);

  List<Widget> _gradientsSteps(Meal meal) {
    return [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Card(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Gradients',
                  style: const TextStyle(fontSize: 26),
                ),
                ...meal.ingredients
                    .map((e) => ListTile(
                          title: Text(e),
                        ))
                    .toList()
              ],
            ),
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Card(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              children: [
                Text(
                  'Steps',
                  style: const TextStyle(fontSize: 26),
                ),
                ...meal.steps
                    .map((e) => Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 50,
                                  child: Text('${meal.steps.indexOf(e) + 1}'),
                                ),
                                title: Text(e),
                              ),
                            ),
                          ],
                        ))
                    .toList()
              ],
            ),
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;
    final appBar = AppBar(
      title: Text(meal.title),
    );
    return Scaffold(
      appBar: appBar,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.favorite,
          color:
              meal.isFavorite ? Theme.of(context).primaryColor : Colors.black54,
        ),
        onPressed: () {
          print(meal.isFavorite);
          meal.switchFavorite();
          _setFavorite();
        },
      ),
      body: Container(
        height:
            MediaQuery.of(context).size.height - appBar.preferredSize.height,
        child: LayoutBuilder(
          builder: (ctx, constraints) => SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        meal.imageUrl,
                        height: max(constraints.maxWidth - 600, 500) * 2 / 3,
                        width: max(constraints.maxWidth - 600, 500),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      children: _gradientsSteps(meal),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
