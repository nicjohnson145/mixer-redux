import 'package:redux/redux.dart';
import 'package:mixer/models/drink.dart';
import 'package:mixer/actions/drink_actions.dart';

final drinksReducer = combineReducers<List<Drink>>([
    TypedReducer<List<Drink>, AddDrinkAction>(_addDrink),
    TypedReducer<List<Drink>, UpdateDrinkAction>(_updateDrink),
    TypedReducer<List<Drink>, DeleteDrinkAction>(_deleteDrink),
]);

List<Drink> _addDrink(List<Drink> drinks, AddDrinkAction action) {

}

List<Drink> _updateDrink(List<Drink> drinks, UpdateDrinkAction action) {

}

List<Drink> _deleteDrink(List<Drink> drinks, DeleteDrinkAction action) {

}
