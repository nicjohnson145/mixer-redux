import 'package:mixer/models/models.dart';

List<Drink> drinksSelector(AppState state) {
    return state.drinks;
}

Drink drinkSelector(AppState state, int id) {
    return drinksSelector(state).firstWhere((drink) => drink.id == id);
}
