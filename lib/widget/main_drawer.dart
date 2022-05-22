// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:meals_app/screen/filter_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(String text, IconData iconData, Function tapHandeler) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              iconData,
              size: 22,
              color: Color(0xffff0000),
            ),
            title: Text(
              text,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "RobotoCondensed",
                  color: Colors.white),
            ),
            onTap: () {tapHandeler();},
          ),
          // Divider(
          //   color: Colors.grey,
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xff1E1E1E),
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 28,
                color: Theme.of(context).canvasColor,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          buildListTile("Meals", Icons.restaurant, () {
             Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile("Filter", Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          }),
        ],
      ),
    );
  }
}
