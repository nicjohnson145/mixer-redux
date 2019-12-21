import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:mixer/models/models.dart';
import 'package:mixer/containers/edit_drink.dart';
import 'package:mixer/actions/drink_actions.dart';
import 'package:mixer/util/routes.dart';
import 'package:mixer/presentation/home_screen.dart';


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
                actions: [
                    IconButton(
                        icon: Icon(Icons.delete_forever),
                        onPressed: () {
                            this.confirmDelete(context);
                        }
                    ),
                ],
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
                                uuid: this.drink.uuid
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

    Future<void> confirmDelete(BuildContext context) async {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => AlertDialog(
                title: Text("Confirm"),
                content: Text("Are you sure you want to delete? This action cannot be undone"),
                actions: <Widget>[
                    FlatButton(
                        child: Text('No'),
                        onPressed: () {
                            Navigator.of(context).pop();
                        },
                    ),
                    FlatButton(
                        child: Text('Yes'),
                        onPressed: () {
                            StoreProvider.of<AppState>(context)
                                .dispatch(DeleteDrinkAction(this.drink.uuid));
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (_) {
                                        return HomeScreen(onInit: this.noop);
                                    },
                                ),
                                (_) => false,
                            );
                        },
                    ),
                ],
                elevation: 24.0,
            ),
        );
    }

    void noop() {

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
