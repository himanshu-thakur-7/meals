import 'package:flutter/material.dart';
import '../screens/filters.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
      onTap: () {
        tapHandler();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.center,
          color: Theme.of(context).accentColor,
          child: Text(
            'Cook Delicious!',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 30,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        buildListTile('Meals', Icons.restaurant_menu, () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        SizedBox(
          height: 10,
        ),
        buildListTile('Filters', Icons.filter_list_alt, () {
          Navigator.of(context).pushReplacementNamed(Filters.routeName);
        })
      ],
    ));
  }
}
