import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:mixer/models/models.dart';
import 'package:mixer/selectors/selectors.dart';
import 'package:mixer/presentation/bulk_export_screen.dart';

class BulkExport extends StatelessWidget {

    BulkExport({Key key}) : super(key: key);

    @override build(BuildContext context) {
        return StoreConnector<AppState, _ViewModel>(
            converter: _ViewModel.fromStore,
            builder: (BuildContext context, _ViewModel vm) {
                return BulkExportScreen(
                    drinks: vm.drinks,
                );
            }
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
