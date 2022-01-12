import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class FavoritesPage extends StatelessWidget {
  static const routeName = '/favorites';
  List<Meal> favoriteMeals;

  FavoritesPage({required this.favoriteMeals});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites Page'),
      ),
      drawer: MainDrawer(),
      body: favoriteMeals.isEmpty
          ? Center(
              child: Text('You have not added any favorites Yet'),
            )
          : ListView.builder(
              itemCount: favoriteMeals.length,
              itemBuilder: (ctx, index) {
                final mealData = favoriteMeals[index];

                return MealItemPage(mealData: mealData);
              },
            ),
    );
  }
}
