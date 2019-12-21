import 'package:mixer/models/models.dart';

class AddDrinkAction {
    final Drink drink;

    AddDrinkAction(this.drink);
}


class UpdateDrinkAction {
    final String uuid;
    final Drink updatedDrink;

    UpdateDrinkAction({
        this.uuid,
        this.updatedDrink,
    });
}


class DeleteDrinkAction {
    final String uuid;

    DeleteDrinkAction(this.uuid);
}
