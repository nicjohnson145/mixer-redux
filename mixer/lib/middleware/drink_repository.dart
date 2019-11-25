import 'dart:async';
import 'dart:core';

import 'package:meta/meta.dart';

import 'package:mixer/middleware/file_storage.dart';
import 'package:mixer/models/models.dart';

class DrinkRepository {
    final FileStorage fileStorage;

    DrinkRepository({
        @required this.fileStorage,
    });

    Future<List<Drink>> loadDrinks() async {
        return await this.fileStorage.loadDrinks();
    }

    Future saveDrinks(List<Drink> drinks) {
        return Future.wait<dynamic>([
            this.fileStorage.saveDrinks(drinks),
        ]);
    }
}


