import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import './models/meal.dart';
import './screens/meal_details.dart';
import './screens/category_meals.dart';
import './screens/home_screen.dart';
import './data/dummy_data.dart';
import './models/filters.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _filteredMeals = DUMMY_MEALS;
  List<Meal> _favoritMeals = [];

  Map<Filter, bool> _filters = {
    Filter.Lactose: false,
    Filter.Gluten: false,
    Filter.Vegan: false,
    Filter.Vegetrian: false,
  };

  void _filterMeals() {
    _filteredMeals = DUMMY_MEALS.where((element) {
      if (_filters[Filter.Lactose] && !element.isLactoseFree) return false;
      if (_filters[Filter.Gluten] && !element.isGlutenFree) return false;
      if (_filters[Filter.Vegan] && !element.isVegan) return false;
      if (_filters[Filter.Vegetrian] && !element.isVegetarian) return false;
      return true;
    }).toList();
  }

  void _resetFilters(Map<Filter, bool> map) {
    setState(() {
      _filters = map;
      _filterMeals();
    });
  }

  void _resetFavorites() {
    setState(() {
      _favoritMeals =
          DUMMY_MEALS.where((element) => element.isFavorite).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeal',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            headline1: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(_resetFilters, _filters, _favoritMeals),
      routes: {
        CategoryMeals.route: (ctx) => CategoryMeals(_filteredMeals),
        MealDetails.route: (ctx) => MealDetails(_resetFavorites),
      },
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AE'),
        Locale('en', 'US'),
      ],
      locale: Locale('en', 'AE'),
    );
  }
}
