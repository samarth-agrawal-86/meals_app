import 'package:flutter/material.dart';

import '../dummy_data.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeals'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(10),
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        children: DUMMY_CATEGORIES.map((catData) {
          return Container(
            padding: const EdgeInsets.all(15),
            child: Center(
                child: Text(
              catData.title,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            )),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [catData.color.withOpacity(0.7), catData.color],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
