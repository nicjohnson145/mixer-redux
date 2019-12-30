import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:mixer/actions/drink_actions.dart';
import 'package:mixer/models/models.dart';
import 'package:mixer/presentation/bulk_import_screen.dart';

class BulkImport extends StatelessWidget {

    BulkImport({Key key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return StoreConnector<AppState, _ViewModel>(
            converter: _ViewModel.from,
            builder: (BuildContext context, _ViewModel vm) {
                return BulkImportScreen(
                    importFunc: vm.importFunc,
                );
            },
        );
    }

}

class _ViewModel {
    final ImportCallback importFunc;

    _ViewModel({
        @required this.importFunc,
    });

    static _ViewModel from(Store<AppState> store) {
        return _ViewModel(
            importFunc: (Drink drink) {
                store.dispatch(AddDrinkAction(drink));
            },
        );
    }
}
