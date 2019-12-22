import 'package:redux/redux.dart';
import 'package:mixer/util/enums.dart';
import 'package:mixer/actions/sort_order_actions.dart';

final sortOrderReducer = combineReducers<SortOrder>([
    TypedReducer<SortOrder, UpdateSortOrderAction>(_sortOrderReducer),
]);

SortOrder _sortOrderReducer(SortOrder sortOrder, UpdateSortOrderAction action) {
    return action.sortOrder;
}
