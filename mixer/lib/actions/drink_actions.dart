import 'package:mixer/models/models.dart';

class AddDrinkAction {
    final Drink drink;

    AddDrinkAction(this.drink);
}


class UpdateDrinkAction {
    final int id;
    final Drink updatedDrink;

    UpdateDrinkAction({
        this.id,
        this.updatedDrink,
    });
}


class DeleteDrinkAction {
    final int id;

    DeleteDrinkAction(this.id);
}
