import 'package:flutter/material.dart';

import './dummy_data.dart';
import './models/meal.dart';
import './screens/tabs_page.dart';
import './screens/categories_page.dart';
import './screens/category_meals_page.dart';
import './screens/favorites_page.dart';
import './screens/meal_details_page.dart';
import './screens/filters_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _filteredMeals = DUMMY_MEALS;
  var _filters = {
    'glutten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  void _applyFilters(Map<String, bool> appliedFilters) {
    setState(() {
      _filters = appliedFilters;
      _filteredMeals = DUMMY_MEALS.where((meal) {
        if (_filters['glutten'] == true && meal.isGlutenFree == false)
          return false;
        if (_filters['lactose'] == true && meal.isLactoseFree == false)
          return false;
        if (_filters['vegan'] == true && meal.isVegan == false) return false;
        if (_filters['vegetarian'] == true && meal.isVegetarian == false)
          return false;
        else
          return true;
      }).toList();
    });
  }

  @override
  void initState() {
    super.initState();
  }

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
      //home: const TabsPage(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsPage(),
        //CategoriesPage.routeName: (ctx) => CategoriesPage(),
        CategoryMealsPage.routeName: (ctx) =>
            CategoryMealsPage(availableMeals: _filteredMeals),
        MealDetailsPage.routeName: (ctx) => MealDetailsPage(),
        //FavoritesPage.routeName: (ctx) => FavoritesPage(),
        FiltersPage.routeName: (ctx) => FiltersPage(
              filters: _filters,
              filterHandler: _applyFilters,
            ),
      },
    );
  }
}
