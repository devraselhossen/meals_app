// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import '../model/meal.dart';
import '../widget/meal_item.dart';

class FavouriteScreen extends StatelessWidget {

  final List<FoodModel> favouriteMeal;

  FavouriteScreen(this.favouriteMeal);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeal.isEmpty) {
      return Center(child: Text("You have no favourites yet - start adding some!"));
    }
    else{
      return ListView.builder(
            itemCount: favouriteMeal.length,
            itemBuilder: (context, index) {
              return MealItem(
                title: favouriteMeal[index].title,
                imageUrl: favouriteMeal[index].imageUrl,
                duration: favouriteMeal[index].duration,
                complexity: favouriteMeal[index].complexity,
                affordability: favouriteMeal[index].affordability,
                id: favouriteMeal[index].id,
              );
            });
    }
  }
}
