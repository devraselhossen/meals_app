// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';

import 'screen/category_meals_screen.dart';
import 'screen/filter_screen.dart';
import 'screen/meal_detail_screen.dart';
import 'screen/tabs_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        CategoryMealsScreen.routeName: (_) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (_) => MealDetailScreen(),
        FilterScreen.routeName: (_) => FilterScreen(),
      },
    );
  }
}
