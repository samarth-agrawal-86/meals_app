import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/category.dart';
import '../models/meal.dart';
import '../dummy_data.dart';

class CategoryMealsPage extends StatelessWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;
  CategoryMealsPage({required this.availableMeals});

  @override
  Widget build(BuildContext context) {
    final categoryData = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryMeals = availableMeals.where((meal) {
      return meal.categories.contains(categoryData.id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryData.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          final mealData = categoryMeals[index];

          return MealItemPage(mealData: mealData);
        },
      ),
    );
  }
}
