import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/mealitem.dart';

class Favourites extends StatelessWidget {
  final List<Meal> _favoriteMeals;
  Favourites(this._favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (_favoriteMeals.isEmpty) {
      return Center(
        child: Text('You got no favorites yet..try adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: _favoriteMeals[index].id,
            imgUrl: _favoriteMeals[index].imageUrl,
            title: _favoriteMeals[index].title,
            duration: _favoriteMeals[index].duration,
            affordability: _favoriteMeals[index].affordability,
            complexity: _favoriteMeals[index].complexity,
          );
        },
        itemCount: _favoriteMeals.length,
      );
    }
  }
}
