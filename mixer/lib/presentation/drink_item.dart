import 'package:flutter/material.dart';
import 'package:mixer/models/models.dart';

class DrinkItem extends StatelessWidget {
    final Drink drink;

    DrinkItem({
        @required this.drink,
    });

    @override
    Widget build(BuildContext context) {
        return ListTile(
            title: Text(
                this.drink.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.title,
            ),
            subtitle: Text(
                this.drink.primary_alcohol,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subhead,
            ),
        );
    }
}
