import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:mixer/actions/drink_actions.dart';
import 'package:mixer/models/models.dart';
import 'package:mixer/presentation/drink_details_screen.dart';
import 'package:mixer/selectors/selectors.dart';

class DrinkDetails extends StatelessWidget {
    final String uuid;

    DrinkDetails({Key key, @required this.uuid}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return StoreConnector<AppState, _ViewModel>(
            converter: (Store<AppState> store) {
                return _ViewModel.from(store, this.uuid);
            },
            builder: (BuildContext context, _ViewModel vm) {
                return DrinkDetailsScreen(
                    drink: vm.drink,
                );
            },
        );
    }
}

class _ViewModel {
    final Drink drink;

    _ViewModel({
        @required this.drink,
    });

    factory _ViewModel.from(Store<AppState> store, String uuid) {
        return _ViewModel(
            drink: drinkSelector(store.state, uuid),
        );
    }
}
