// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

import '../widget/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  // Widget buildSwitchListTile(
  //     String title, String subTitle, bool currentValue, Function updateValue) {
  //   return SwitchListTile(
  //     title: Text(title),
  //     value: currentValue,
  //     subtitle: Text(subTitle),
  //     onChanged: updateValue(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Filters")),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Adjust your meal section.",
                style: Theme.of(context).textTheme.titleLarge),
          ),
          Expanded(
              child: ListView(
            children: [
              // buildSwitchListTile(
              //   "Gluten-free",
              //   "Only include gluten-free meals",
              //   _glutenFree,
              //   (newValue) {
              //     setState(() {
              //       _glutenFree = newValue;
              //     });
              //   },
              // ),
              // buildSwitchListTile(
              //   "Lactose-free",
              //   "Only include lactose-free meals",
              //   _lactoseFree,
              //   (newValue) {
              //     setState(() {
              //       _lactoseFree = newValue;
              //     });
              //   },
              // ),
              // buildSwitchListTile(
              //   "Vegetarian",
              //   "Only include vegetarian meals",
              //   _vegetarian,
              //   (newValue) {
              //     setState(() {
              //       _vegetarian = newValue;
              //     });
              //   },
              // ),
              // buildSwitchListTile(
              //   "Vegan",
              //   "Only include vegan meals",
              //   _vegan,
              //   (newValue) {
              //     setState(() {
              //       _vegan = newValue;
              //     });
              //   },
              // ),
              SwitchListTile(
                title: Text("Gluten-free"),
                value: _glutenFree,
                subtitle: Text("Only include gluten-free meals"),
                onChanged: (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
              ),
              SwitchListTile(
                title: Text("Lactose-free"),
                value: _lactoseFree,
                subtitle: Text("Only include lactose-free meals"),
                onChanged: (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
              SwitchListTile(
                title: Text("Vegetarian"),
                value: _vegetarian,
                subtitle: Text("Only include vegetarian meals"),
                onChanged: (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
              ),
              SwitchListTile(
                title: Text("Vegan"),
                value: _vegan,
                subtitle: Text("Only include vegan meals"),
                onChanged: (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
              ),
            ],
          )),
        ],
      ),
    );
  }
}
