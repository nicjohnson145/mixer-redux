import 'package:mixer/models/models.dart';

class LoadDrinksAction {}

class DrinksLoadedAction {
    final List<Drink> drinks;

    DrinksLoadedAction(this.drinks);
}

class DrinksNotLoadedAction {}
