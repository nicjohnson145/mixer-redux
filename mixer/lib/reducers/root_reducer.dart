import 'package:mixer/models/models.dart';
import 'package:mixer/reducers/drinks_reducer.dart';

AppState appReducer(AppState state, action) {
    return AppState(
        drinks: drinksReducer(state.drinks, action),
    );
}
