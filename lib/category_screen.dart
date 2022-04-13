// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CategoryesScreen extends StatelessWidget {
  const CategoryesScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      children: [

      ],
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 3 / 2,
        maxCrossAxisExtent: 200
        ),
    );
  }
}