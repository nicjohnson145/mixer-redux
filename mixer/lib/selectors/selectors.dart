import 'package:mixer/models/models.dart';
import 'package:mixer/models/sort_order.dart';

typedef DrinkComparisonFunc = int Function(Drink a, Drink b);

List<Drink> drinksSelector(AppState state) {
    return state.drinks;
}

SortOrder sortOrderSelector(AppState state) {
    return state.sortOrder;
}

Drink drinkSelector(AppState state, String uuid) {
    return drinksSelector(state).firstWhere((drink) => drink.uuid == uuid);
}

List<Drink> sortedDrinks(AppState state, SortOrder order) {
    var newList = drinksSelector(state).toList();
    newList.sort(_comparator(order));
    return newList;
}

DrinkComparisonFunc _comparator(SortOrder order) {
    switch (order) {
        case SortOrder.Name_Alphabetical: {
            return __cmp_nameAlphabetical;
        }
        break;

        case SortOrder.Alcohol_Alphabetical: {
            return __cmp_alcoholAlphabetical;
        }
        break;

        default: {
            return __cmp_nameAlphabetical;
        }
    }
}

int __cmp_nameAlphabetical(Drink a, Drink b) => a.name.compareTo(b.name);
int __cmp_alcoholAlphabetical(Drink a, Drink b)  => a.primary_alcohol.compareTo(b.primary_alcohol);
