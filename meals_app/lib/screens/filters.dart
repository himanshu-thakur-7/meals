import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class Filters extends StatefulWidget {
  static const routeName = '/filters';
  final Function _setFilterSettings;
  final Map<String, bool> _filt;
  Filters(this._setFilterSettings, this._filt);
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var _gluttenfree = false;

  var _lactosefree = false;

  var _vegan = false;

  var _vegetarian = false;

  @override
  void initState() {
    _gluttenfree = widget._filt['gluten'];
    _lactosefree = widget._filt['lactose'];
    _vegetarian = widget._filt['vegetarian'];
    _vegan = widget._filt['vegan'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            tooltip: 'Save filters',
            onPressed: () {
              final _filters = {
                'gluten': _gluttenfree,
                'lactose': _lactosefree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget._setFilterSettings(_filters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                SwitchListTile(
                  value: _gluttenfree,
                  onChanged: (newVal) {
                    setState(() {
                      _gluttenfree = newVal;
                    });
                  },
                  title: Text('Gluten-free'),
                  subtitle: Text('Only include gluten-free meals'),
                ),
                SwitchListTile(
                  value: _lactosefree,
                  onChanged: (newVal) {
                    setState(() {
                      _lactosefree = newVal;
                    });
                  },
                  title: Text('Lactose-free'),
                  subtitle: Text('Only include Lactose-free meals'),
                ),
                SwitchListTile(
                  value: _vegan,
                  onChanged: (newVal) {
                    setState(() {
                      _vegan = newVal;
                    });
                  },
                  title: Text('Vegan'),
                  subtitle: Text('Only include vegan meals'),
                ),
                SwitchListTile(
                  value: _vegetarian,
                  onChanged: (newVal) {
                    setState(() {
                      _vegetarian = newVal;
                    });
                  },
                  title: Text('Vegetarian'),
                  subtitle: Text('Only include vegetarian meals'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
