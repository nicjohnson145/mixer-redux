import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mixer/models/models.dart';
import 'package:mixer/containers/edit_drink.dart';


class DrinkDetailsScreen extends StatelessWidget {
    final Drink drink;

    DrinkDetailsScreen({
        Key key,
        @required this.drink,
    }) : super(key: key);

    num get edgeInsets => 10.0;

    EdgeInsetsGeometry get verticalPadding {
        return EdgeInsets.symmetric(vertical: 10.0);
    }

    TextStyle get labelStyle {
        return TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
        );
    }

    @override build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("Details"),
            ),
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: this.edgeInsets),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: this.getBody(),
                ),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) {
                            return EditDrink(
                                id: this.drink.id
                            );
                        },
                    ));
                },
                child: Icon(Icons.edit),
            ),
        );
    }

    List<Widget> getBody() {
        List<Widget> components = [
            this.basicValue('Name', this.drink.name),
            this.basicValue('Primary Alcohol', this.drink.primary_alcohol),
            this.basicValue('Preferred Glass', this.drink.preferred_glass),
        ];

        if (this.drink.instructions != null) {
            components.add(this.basicValue('Instructions', this.drink.instructions));
        }

        components.add(this.basicValue('Ingredients', ''));
        components.add(this.getIngredientsList());

        return components;
    }

    Widget basicValue(String label, String value) {
        return Padding(
            padding: this.verticalPadding,
            child: Text.rich(
                TextSpan(
                    text: "",
                    children: [
                        TextSpan(
                            text: label + ': ',
                            style: this.labelStyle,
                        ),
                        TextSpan(
                            text: value
                        ),
                    ],
                ),
            ),
        );
    }

    Widget getIngredientsList() {
        return Expanded(
            child: Scrollbar(
                child: ListView.builder(
                    itemCount: this.drink.ingredients.length,
                    itemBuilder: (BuildContext context, int index) {
                        return _IngredientCard(this.drink.ingredients[index]);
                    }
                )
            ),
        );
    }

}


class _IngredientCard extends StatelessWidget {
    final String ingredient;

    _IngredientCard(this.ingredient);

    @override build(BuildContext context) {
        return Container(
            height: 35,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                    Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(this.ingredient),
                    ),
                ],
            ),
        );
    }
}
