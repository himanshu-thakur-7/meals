import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import '../screens/favourites.dart';
import '../screens/categories.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> _favoriteMeals;
  TabsScreen(this._favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  List<Map<String, Object>> _pages;
  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': Favourites(widget._favoriteMeals), 'title': 'Favorites'}
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedIndex]['title']),
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Theme.of(context).accentColor,
            onTap: _selectPage,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.black,
            currentIndex: _selectedIndex,
            items: [
              BottomNavigationBarItem(
                  //  backgroundColor: Theme.of(context).accentColor.withOpacity(0.4),
                  icon: Icon(
                    Icons.category,
                    size: 29,
                  ),
                  title: Text(
                    'Categories',
                  )),
              BottomNavigationBarItem(
                // backgroundColor: Theme.of(context).accentColor.withOpacity(0.4),
                icon: Icon(
                  Icons.favorite,
                  size: 29,
                ),
                title: Text('Favorites'),
              )
            ]),
      ),
    );
  }
}
