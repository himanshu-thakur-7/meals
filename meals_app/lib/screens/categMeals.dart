import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/mealitem.dart';
//import '../models/category.dart';
//import '../dummy_data.dart';

class CategoryMeals extends StatelessWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;
  CategoryMeals(this.availableMeals);
  // CategoryMeals(this.categoryTitle,this.id);
  // final String categoryTitle;
  // final String id;
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final id = routeArgs['id'];
    final CategoryMeals =
        availableMeals.where((meal) => meal.categories.contains(id)).toList();
    return Scaffold(
      appBar: AppBar(
          title: Hero(tag: categoryTitle, child: Text('$categoryTitle'))),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: CategoryMeals[index].id,
            imgUrl: CategoryMeals[index].imageUrl,
            title: CategoryMeals[index].title,
            duration: CategoryMeals[index].duration,
            affordability: CategoryMeals[index].affordability,
            complexity: CategoryMeals[index].complexity,
          );
        },
        itemCount: CategoryMeals.length,
      ),
    );
  }
}
