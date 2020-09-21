import 'package:flutter/material.dart';

import './tabs/cateogries_tab.dart';
import './tabs/favorits_tab.dart';
import './tabs/filters_tab.dart';
import '../widgets/drawer.dart';
import '../models/meal.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/';

  final Function _resetFilters;
  final _filters;
  final List<Meal> _favoriteMeals;

  HomeScreen(this._resetFilters, this._filters, this._favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Text('DeliMeal'),
              const SizedBox(width: 4),
              const Icon(Icons.favorite_sharp),
            ],
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Icon(Icons.category),
                iconMargin: EdgeInsets.symmetric(vertical: 100),
              ),
              Tab(
                child: Icon(Icons.star),
              ),
              Tab(
                child: Icon(Icons.filter_list_alt),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoriesTab(),
            FavoritsTab(_favoriteMeals),
            FiltersTab(_resetFilters, _filters),
          ],
        ),
        drawer: HomeDrawer(),
      ),
    );
  }
}
