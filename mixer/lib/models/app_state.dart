import 'drink.dart';
import 'package:mixer/util/enums.dart';

class AppState {
    final bool isLoading;
    final List<Drink> drinks;
    final SortOrder sortOrder;

    AppState({
        this.isLoading = false,
        this.drinks = const [],
        this.sortOrder = SortOrder.None,
    });

    factory AppState.loading() => AppState(isLoading: true);

    AppState copyWith({
        bool isLoading,
        List<Drink> drinks,
        SortOrder sortOrder,

    }){
        return AppState(
            isLoading: isLoading ?? this.isLoading,
            drinks: drinks ?? this.drinks,
            sortOrder: sortOrder ?? this.sortOrder,
        );
    }

    @override
    String toString() {
        return 'AppState(isLoading: $isLoading, drinks: $drinks, sortOrder: $sortOrder)';
    }
}
