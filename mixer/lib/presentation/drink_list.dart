import 'package:flutter/material.dart';
import 'package:mixer/presentation/drink_item.dart';
import 'package:mixer/models/models.dart';

class DrinkList extends StatelessWidget {
    final List<Drink> drinks;

    DrinkList({
        Key key,
        @required this.drinks,
    }) : super(key: key);

    Widget build(BuildContext context) {
        return this._buildListView();
    }

    ListView _buildListView() {
        return ListView.builder(
            itemCount: this.drinks.length,
            itemBuilder: (BuildContext context, int index) {
                final drink = this.drinks[index];

                return DrinkItem(
                    drink: drink,
                );
            },
        );
    }
}
