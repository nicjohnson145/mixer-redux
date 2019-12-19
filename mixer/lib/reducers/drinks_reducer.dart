import 'package:redux/redux.dart';
import 'package:mixer/models/drink.dart';
import 'package:mixer/actions/drink_actions.dart';
import 'package:mixer/actions/loading_actions.dart';

final drinksReducer = combineReducers<List<Drink>>([
    TypedReducer<List<Drink>, AddDrinkAction>(_addDrink),
    TypedReducer<List<Drink>, UpdateDrinkAction>(_updateDrink),
    TypedReducer<List<Drink>, DeleteDrinkAction>(_deleteDrink),
    TypedReducer<List<Drink>, DrinksLoadedAction>(_setDrinks),
    TypedReducer<List<Drink>, DrinksNotLoadedAction>(_setNoDrinks),
]);

List<Drink> _addDrink(List<Drink> drinks, AddDrinkAction action) {
    return drinks.toList()..add(action.drink);
}

List<Drink> _updateDrink(List<Drink> drinks, UpdateDrinkAction action) {

}

List<Drink> _deleteDrink(List<Drink> drinks, DeleteDrinkAction action) {
    return drinks.where((drink) => drink.id != action.id).toList();
}

List<Drink> _setDrinks(List<Drink> drinks, DrinksLoadedAction action) {
    return action.drinks;
}

List<Drink> _setNoDrinks(List<Drink> drinks, DrinksNotLoadedAction action) {
    return [];
}
