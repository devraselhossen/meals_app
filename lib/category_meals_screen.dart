// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "/category-meal";

  @override
  Widget build(BuildContext context) {

    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgs["id"];
    final categoryTitle = routeArgs["title"];
    final categoryMeals = FOOD_DATA.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
          return Text(categoryMeals[index].title);
        }
        )
    );
  }
}
