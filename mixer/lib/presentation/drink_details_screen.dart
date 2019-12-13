import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mixer/models/models.dart';

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
                    children: this.getMainBody(),
                ),
            ),
        );
    }

    List<Widget> getMainBody() {
        List<Widget> components = [
            this.basicValue('Name', this.drink.name),
            this.basicValue('Primary Alcohol', this.drink.primary_alcohol),
            this.basicValue('Preferred Glass', this.drink.preferred_glass),
        ];
        if (this.drink.instructions != null) {
            components.add(this.basicValue('Instructions', this.drink.instructions));
        }
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
}
