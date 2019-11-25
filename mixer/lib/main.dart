import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:mixer/actions/loading_actions.dart';
import 'package:mixer/containers/add_drink.dart';
import 'package:mixer/middleware/store_drinks_middleware.dart';
import 'package:mixer/models/models.dart';
import 'package:mixer/presentation/home_screen.dart';
import 'package:mixer/reducers/root_reducer.dart';
import 'package:mixer/util/routes.dart';

void main() => runApp(Mixer());

class Mixer extends StatelessWidget {

    final store = Store<AppState>(
        appReducer,
        initialState: AppState(),
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
                routes: {
                    AppRoute.Home: (context) {
                        return HomeScreen(
                            onInit: () {
                                StoreProvider.of<AppState>(context).dispatch(LoadDrinksAction());
                            },
                        );
                    },
                    AppRoute.AddDrink: (context) {
                        return AddDrink();
                    },
                },
            ),
        );
    }
}

