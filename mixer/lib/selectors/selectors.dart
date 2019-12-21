import 'package:mixer/models/models.dart';

List<Drink> drinksSelector(AppState state) {
    return state.drinks;
}

Drink drinkSelector(AppState state, String uuid) {
    return drinksSelector(state).firstWhere((drink) => drink.uuid == uuid);
}
