import 'package:flutter/material.dart';

import '../../models/filters.dart';

class FiltersTab extends StatefulWidget {
  @override
  _FiltersTabState createState() => _FiltersTabState(_filters);

  final Function resetFilters;
  final _filters;

  FiltersTab(this.resetFilters, this._filters);
}

class _FiltersTabState extends State<FiltersTab> {
  Map _filters;
  bool _vegan, _vegetarian, _lactoseFree, _glutenFree;

  _FiltersTabState(this._filters) {
    _vegan = _filters[Filter.Vegan];
    _vegetarian = _filters[Filter.Vegetrian];
    _lactoseFree = _filters[Filter.Lactose];
    _glutenFree = _filters[Filter.Gluten];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          widget.resetFilters({
            Filter.Gluten: _glutenFree,
            Filter.Lactose: _lactoseFree,
            Filter.Vegan: _vegan,
            Filter.Vegetrian: _vegetarian,
          });
        },
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Filter your favorite types of food!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile.adaptive(
                title: Text('Vegan Food'),
                subtitle: Text('include vegan meals'),
                value: _vegan,
                onChanged: (val) {
                  setState(() => _vegan = val);
                },
                contentPadding: EdgeInsets.all(10),
              ),
              SwitchListTile.adaptive(
                title: Text('Vegetarian Food'),
                subtitle: Text('include vegetarian meals'),
                value: _vegetarian,
                onChanged: (val) {
                  setState(() => _vegetarian = val);
                },
                contentPadding: EdgeInsets.all(10),
              ),
              SwitchListTile.adaptive(
                title: Text('Lactose-Free'),
                subtitle: Text('include meals that are lactose-Free'),
                value: _lactoseFree,
                onChanged: (val) {
                  setState(() => _lactoseFree = val);
                },
                contentPadding: EdgeInsets.all(10),
              ),
              SwitchListTile.adaptive(
                title: Text('Gluten-Free'),
                subtitle: Text('include meals that are gluten-Free'),
                value: _glutenFree,
                onChanged: (val) {
                  setState(() => _glutenFree = val);
                },
                contentPadding: EdgeInsets.all(10),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
