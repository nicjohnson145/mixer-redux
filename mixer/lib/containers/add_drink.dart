import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:mixer/actions/drink_actions.dart';
import 'package:mixer/models/models.dart';
import 'package:mixer/presentation/add_edit_screen.dart';
import 'package:mixer/util/keys.dart';

class AddDrink extends StatelessWidget {

    AddDrink({Key key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return StoreConnector<AppState, OnSaveCallback>(
            converter: this.addDrink,
            builder: (BuildContext contet, OnSaveCallback onSave) {
                return AddEditScreen(
                    key: MixerKeys.AddDrinkScreen,
                    onSave: onSave,
                    isEditing: false,
                );
            },
        );
    }

    OnSaveCallback addDrink(Store<AppState> store) {
        return (int id, Drink drink) {
            store.dispatch(AddDrinkAction(drink));
        };
    }
}
