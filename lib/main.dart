// ignore_for_file: prefer_const_constructors, deprecated_member_use

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

  List<FoodModel> availableMeals = FOOD_DATA;
  // List<FoodModel> ?favouritesMeals;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      availableMeals = FOOD_DATA.where(
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
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (_) =>
            CategoryMealsScreen(availableMeals),
        MealDetailScreen.routeName: (_) => MealDetailScreen(),
        FilterScreen.routeName: (_) => FilterScreen(_setFilters,_filters),
      },
    );
  }
}
