import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:mixer/models/models.dart';
import 'package:mixer/pages/home_page.dart';
import 'package:mixer/reducers/root_reducer.dart'; 

void main() => runApp(Mixer());

class Mixer extends StatelessWidget {

    final store = Store<AppState>(
        appReducer,
        initialState: AppState(
            drinks: List.from([
                Drink(
                    1,
                    'Daquari',
                    'Rum',
                    'Coupe',
                    ['0.5 oz simple syrup', '1 lime', '2.5 oz rum'],
                    null,
                ),
                Drink(
                    2,
                    'Blueberry Cilantro Margarita',
                    'Tequila',
                    'Rocks',
                    ['1 lime', 'handful blueberries',  'few stems chopped cilantro', '0.5 oz St. Elder', '2.5 oz tequila'],
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                ),
            ]),
        ),
        middleware: [

        ],
    );

    @override
    Widget build(BuildContext context) {
        return StoreProvider(
            store: this.store,
            child: MaterialApp(
                title: 'Mixer',
                theme: ThemeData(brightness: Brightness.dark),
                home: HomePage(),
            ),
        );
    }
}

