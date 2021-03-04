import 'package:flutter/material.dart';
import '../screens/categMeals.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({this.title, this.color, this.id});
  final String title;
  final Color color;
  final String id;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(CategoryMeals.routeName,
            arguments: {'id': id, 'title': title});
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
          padding: const EdgeInsets.all(15),
          child: Hero(
            tag: title,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          )),
    );
  }
}
