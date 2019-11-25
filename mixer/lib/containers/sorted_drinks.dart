import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:mixer/models/models.dart';
import 'package:mixer/selectors/selectors.dart';
import 'package:mixer/presentation/drink_list.dart';

class SortedDrinks extends StatelessWidget {

    SortedDrinks({Key key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return StoreConnector<AppState, _ViewModel>(
            converter: _ViewModel.fromStore,
            builder: (BuildContext context, _ViewModel vm) {
                return DrinkList(
                    drinks: vm.drinks,
                );
            },
        );
    }
}


class _ViewModel {
    final List<Drink> drinks;

    _ViewModel({
        @required this.drinks,
    });

    static _ViewModel fromStore(Store<AppState> store) {
        return _ViewModel(
            drinks: drinksSelector(store.state),
        );
    }
}
