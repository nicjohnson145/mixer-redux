import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:mixer/containers/sorted_drinks.dart';
import 'package:mixer/containers/sort_order_selector.dart';
import 'package:mixer/presentation/extra_actions_button.dart';
import 'package:mixer/util/routes.dart';

// Temp imporrts until testing is done
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mixer/models/models.dart';
import 'package:mixer/actions/drink_actions.dart';


class HomeScreen extends StatefulWidget {

    final void Function() onInit;

    HomeScreen({
        Key key,
        @required this.onInit,
    }) : super(key: key);

    @override
    HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

    @override
    void initState() {
        widget.onInit();
        super.initState();
    }

    List<Widget> getActions() {
        List<Widget> actions = [
            SortOrderSelector(),
            ExtraActionsButton(),
        ];
        if (!kReleaseMode) {
            actions.addAll(<Widget>[
                IconButton(
                    icon: Icon(Icons.add_circle),
                    onPressed: () => this.prepData(context),
                ),
            ]);
        }
        return actions;
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Mixer'),
                actions: this.getActions(),
            ),
            body: Container(
                child: SortedDrinks(),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                    Navigator.of(context).pushNamed(AppRoute.AddDrink);
                },
                child: Icon(Icons.add),
            ),
        );
    }

    void prepData(BuildContext context) {
        List<Drink> drinks = [
                Drink(
                    '64bf0365-a9aa-4311-8862-cc8415a6dddb',
                    'Daquari',
                    'Rum',
                    'Coupe',
                    ['0.5 oz simple syrup', '1 lime', '2.5 oz rum'],
                    null,
                ),
                Drink(
                    '129591d5-40da-453f-b6fa-6ebecc24d214',
                    'Blueberry Cilantro Margarita',
                    'Tequila',
                    'Rocks',
                    ['1 lime', 'handful blueberries',  'few stems chopped cilantro', '0.5 oz St. Elder', '2.5 oz tequila'],
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                ),
        ];
        List<String> longIngs = [];
        for (int i = 0; i < 20; i++) {
            longIngs.add('Ingredient $i');
        }
        drinks.add(
            Drink(
                'a8affc71-b62d-4de2-833f-ae42da6ad0dc',
                'Stress Drink',
                'Bourbon',
                'Rocks',
                longIngs,
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
            )
        );
        for (int i = 0; i < drinks.length; i++) {
            StoreProvider.of<AppState>(context).dispatch(AddDrinkAction(drinks[i]));
        }
    }
}
