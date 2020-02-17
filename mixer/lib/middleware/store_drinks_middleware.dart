import 'package:redux/redux.dart';
import 'package:path_provider/path_provider.dart';

import 'package:mixer/actions/loading_actions.dart';
import 'package:mixer/actions/drink_actions.dart';
import 'package:mixer/middleware/drink_repository.dart';
import 'package:mixer/middleware/file_storage.dart';
import 'package:mixer/selectors/selectors.dart';
import 'package:mixer/models/models.dart';


List<Middleware<AppState>> createStoreDrinksMiddleware([
    DrinkRepository repository = const DrinkRepository(
        fileStorage: const FileStorage(
            'mixer_data_store',
            getApplicationDocumentsDirectory,
        ),
    ),
])
{
    final saveDrinks = _createSaveDrinks(repository);
    final loadDrinks = _createLoadDrinks(repository);

    return [
        TypedMiddleware<AppState, LoadDrinksAction>(loadDrinks),
        TypedMiddleware<AppState, AddDrinkAction>(saveDrinks),
        TypedMiddleware<AppState, UpdateDrinkAction>(saveDrinks),
        TypedMiddleware<AppState, DeleteDrinkAction>(saveDrinks),
    ];
}

Middleware<AppState> _createSaveDrinks(DrinkRepository repository) {
    return (Store<AppState> store, action, NextDispatcher next) {
        next(action);
        repository.saveDrinks(drinksSelector(store.state));
    };
}

Middleware<AppState> _createLoadDrinks(DrinkRepository repository) {
    return (Store<AppState> store, action, NextDispatcher next) {
        repository.loadDrinks().then(
            (drinks) {
                store.dispatch(DrinksLoadedAction(drinks));
            }
        ).catchError(
            (err) {
                print(err);
                store.dispatch(DrinksNotLoadedAction);
            }
        );

        next(action);
    };
}

