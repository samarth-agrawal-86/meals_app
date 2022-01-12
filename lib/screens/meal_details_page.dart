import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailsPage extends StatelessWidget {
  static const routeName = '/meal-details';
  Function favoriteHandler;
  Function isFavorite;

  MealDetailsPage({required this.favoriteHandler, required this.isFavorite});

  Widget buildContainer({required Widget child}) {
    return Container(
      height: 200,
      width: 300,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15)),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealData = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          mealData.title,
          softWrap: true,
          overflow: TextOverflow.fade,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(mealData.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 8),
            buildContainer(
              child: ListView.builder(
                itemCount: mealData.ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text(
                        mealData.ingredients[index],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 8),
            buildContainer(
              child: ListView.builder(
                itemCount: mealData.steps.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Text('#${(index + 1)}'),
                        ),
                        title: Text(mealData.steps[index]),
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealData.id) ? Icons.star : Icons.star_border,
        ),
        onPressed: () {
          favoriteHandler(mealData.id);
        },
      ),
    );
  }
}
