import 'package:flutter/material.dart';

import './screens/category_meals_page.dart';

import './screens/meal_details_page.dart';
import './screens/tabs_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline5: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
      ),
      home: const TabsPage(),
      routes: {
        CategoryMealsPage.routeName: (ctx) => CategoryMealsPage(),
        MealDetailsPage.routeName: (ctx) => MealDetailsPage(),
      },
    );
  }
}
