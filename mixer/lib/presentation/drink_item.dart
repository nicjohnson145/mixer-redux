import 'package:flutter/material.dart';
import 'package:mixer/models/models.dart';
import 'package:mixer/selectors/selectors.dart';
import 'package:mixer/containers/drink_details.dart';


class DrinkItem extends StatelessWidget {
    final Drink drink;

    DrinkItem({
        @required this.drink,
    });

    Widget getCardContents(BuildContext context) {
        return Container(
            child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 10.0,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                        Text(
                            this.drink.name,
                            style: Theme.of(context).textTheme.title,
                        ),
                        Text(
                            this.drink.primary_alcohol,
                            style: Theme.of(context).textTheme.subhead,
                        )
                    ],
                ),
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Card(
            child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () => this._onDrinkTap(context, this.drink),
                child: this.getCardContents(context),
            ),
        );
    }

    void _onDrinkTap(BuildContext context, Drink drink) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) {
                return DrinkDetails(
                    id: drink.id,
                );
            },
        ));
    }
}
