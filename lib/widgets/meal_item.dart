import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/meal_details_page.dart';

class MealItemPage extends StatelessWidget {
  Meal mealData;
  Complexity? complexity;
  Affordability? affordability;

  MealItemPage({required this.mealData});

  String get getComplexity {
    if (complexity == Complexity.Simple) {
      return 'Simple';
    } else if (complexity == Complexity.Challenging) {
      return 'Challenging';
    } else if (complexity == Complexity.Hard) {
      return 'Hard';
    } else {
      return 'N/A';
    }
  }

  String get getAffordability {
    if (affordability == Affordability.Affordable) {
      return 'Affordable';
    } else if (affordability == Affordability.Pricey) {
      return 'Pricey';
    } else if (affordability == Affordability.Luxurious) {
      return 'Luxurious';
    } else {
      return 'N/A';
    }
  }

  @override
  Widget build(BuildContext context) {
    complexity = mealData.complexity;
    affordability = mealData.affordability;
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(MealDetailsPage.routeName, arguments: mealData);
      },
      splashColor: Colors.grey[50],
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  mealData.imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 10,
                right: 0,
                child: Container(
                  alignment: Alignment.centerRight,
                  color: Colors.black45,
                  width: 300,
                  height: 60,
                  child: Text(
                    mealData.title,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.right,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              )
            ]),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(width: 6),
                      Text('${mealData.duration} mins'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(width: 6),
                      Text(getComplexity),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(width: 6),
                      Text(getAffordability),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
