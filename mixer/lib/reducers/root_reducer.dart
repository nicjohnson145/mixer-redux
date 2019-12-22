import 'package:mixer/models/models.dart';
import 'package:mixer/reducers/drinks_reducer.dart';
import 'package:mixer/reducers/sort_order_reducer.dart';

AppState appReducer(AppState state, action) {
    return AppState(
        drinks: drinksReducer(state.drinks, action),
        sortOrder: sortOrderReducer(state.sortOrder, action),
    );
}
