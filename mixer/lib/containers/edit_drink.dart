import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:mixer/actions/drink_actions.dart';
import 'package:mixer/models/models.dart';
import 'package:mixer/presentation/add_edit_screen.dart';
import 'package:mixer/util/keys.dart';
import 'package:mixer/selectors/selectors.dart';

class EditDrink extends StatelessWidget {
    final int id;

    EditDrink({Key key, @required this.id}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return StoreConnector<AppState, _ViewModel>(
            converter: (Store<AppState> store) {
                return _ViewModel.from(store, this.id);
            },
            builder: (BuildContext contet, _ViewModel vm) {
                return AddEditScreen(
                    key: MixerKeys.EditDrinkScreen,
                    onSave: vm.onSave,
                    isEditing: true,
                    drink: vm.drink,
                );
            },
        );
    }
}

class _ViewModel {
    final Drink drink;
    final OnSaveCallback onSave;

    _ViewModel({
        @required this.drink,
        @required this.onSave,
    });

    factory _ViewModel.from(Store<AppState> store, int id) {
        return _ViewModel(
            drink: drinkSelector(store.state, id),
            onSave: (int id, Drink drink) {
                store.dispatch(UpdateDrinkAction(id: id, updatedDrink: drink));
            }
        );
    }
}
