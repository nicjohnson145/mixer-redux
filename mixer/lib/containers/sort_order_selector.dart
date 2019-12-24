import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:mixer/actions/sort_order_actions.dart';
import 'package:mixer/models/models.dart';
import 'package:mixer/presentation/sort_order_button.dart';

class SortOrderSelector extends StatelessWidget {

    SortOrderSelector({Key key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return StoreConnector<AppState, _ViewModel>(
            converter: _ViewModel.fromStore,
            builder: (BuildContext context, _ViewModel vm) {
                return SortOrderButton(
                    onSelected: vm.onOrderSelected,
                    activeOrdering: vm.activeOrdering,
                );
            },
        );
    }
}


class _ViewModel{
    final Function(SortOrder) onOrderSelected;
    final SortOrder activeOrdering;

    _ViewModel({
        @required this.onOrderSelected,
        @required this.activeOrdering,
    });

    static _ViewModel fromStore(Store<AppState> store) {
        return _ViewModel(
            onOrderSelected: (SortOrder ordering) {
                store.dispatch(UpdateSortOrderAction(ordering));
            },
            activeOrdering: store.state.sortOrder,
        );
    }
}
