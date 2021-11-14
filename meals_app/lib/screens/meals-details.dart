import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import '../widgets/basicInfoCard.dart';
import '../dummy_data.dart';

class MealDetails extends StatelessWidget {
  static const routename = '/mealdetails';
  final Function _togglefavorite;
  MealDetails(this._togglefavorite, this._isFavouriteMeal);
  final Function _isFavouriteMeal;

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 40),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> args =
        ModalRoute.of(context).settings.arguments as List<dynamic>;
    final mealid = args[0];
    final duration = args[1];
    final complexity = args[2];
    final affordability = args[3];

    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealid);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Hero(
                  tag: selectedMeal.imageUrl,
                  child: Image.network(
                    selectedMeal.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              GridView(
                padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                children: <Widget>[
                  BasicInfoCard(duration, Icons.access_time),
                  BasicInfoCard(complexity, Icons.assignment_outlined),
                  BasicInfoCard(affordability, Icons.monetization_on_outlined)
                ],
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 140,
                  childAspectRatio: 3 / 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
              ),
              buildSectionTitle(context, 'Ingredients:'),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '${index + 1}.     ${selectedMeal.ingredients[index]}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    );
                  },
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              buildSectionTitle(context, 'Process:'),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.auto_stories,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Text(
                              selectedMeal.steps[index],
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: selectedMeal.steps.length,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          _isFavouriteMeal(mealid) ? Icons.favorite : Icons.favorite_border,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: () => _togglefavorite(mealid),
      ),
    );
  }
}
