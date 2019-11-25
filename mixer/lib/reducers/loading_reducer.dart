import 'package:redux/redux.dart';
import 'package:mixer/actions/loading_actions.dart';

final drinksReducer = combineReducers<bool>([
    TypedReducer<bool, DrinksLoadedAction>(_setLoaded),
    TypedReducer<bool, DrinksNotLoadedAction>(_setLoaded),
]);

bool _setLoaded(bool state, action) {
    return false;
}
