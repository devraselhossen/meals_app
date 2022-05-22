// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'model/meal.dart';
import 'screen/category_meals_screen.dart';
import 'screen/filter_screen.dart';
import 'screen/meal_detail_screen.dart';
import 'screen/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegartian": false
  };

  List<FoodModel> _availableMeals = FOOD_DATA;
  List<FoodModel> _favouritesMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = FOOD_DATA.where(
        (meal) {
          if (_filters["gluten"]! && !meal.isGlutenFree) {
            return false;
          }
          if (_filters["lactose"]! && !meal.isLactoseFree) {
            return false;
          }
          if (_filters["vegan"]! && !meal.isVegan) {
            return false;
          }
          if (_filters["vegartian"]! && !meal.isVegetarian) {
            return false;
          }
          return true;
        },
      ).toList();
    });
  }

  void _toogleFavourite(String mealId) {
    final existingMeal =
        _favouritesMeals.indexWhere((meal) => meal.id == mealId);
    if (existingMeal >= 0) {
      setState(() {
        _favouritesMeals.removeAt(existingMeal);
      });
    }
    else {
      setState(() {
        _favouritesMeals.add(FOOD_DATA.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavourite(String id) {
    return _favouritesMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DailiMeals",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          //bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          //bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
        ),
      ),
      // home: TabsScreen(),
      routes: {
        '/': (ctx) => TabsScreen(_favouritesMeals),
        CategoryMealsScreen.routeName: (_) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (_) => MealDetailScreen(_toogleFavourite, _isMealFavourite),
        FilterScreen.routeName: (_) => FilterScreen(_setFilters, _filters),
      },
    );
  }
}
