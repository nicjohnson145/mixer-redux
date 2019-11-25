import 'drink.dart';

class AppState {
    final bool isLoading;
    final List<Drink> drinks;

    AppState({
        this.isLoading = false,
        this.drinks = const [],
    });

    factory AppState.loading() => AppState(isLoading: true);

    AppState copyWith({
        bool isLoading,
        List<Drink> drinks,
    }){
        return AppState(
            isLoading: isLoading ?? this.isLoading,
            drinks: drinks ?? this.drinks,
        );
    }
}
