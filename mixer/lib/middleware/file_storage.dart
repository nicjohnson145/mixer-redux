import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:mixer/models/models.dart';

class FileStorage {
    final String tag;
    final Future<Directory> Function() getDirectory;

    FileStorage(
        this.tag,
        this.getDirectory,
    );

    Future<List<Drink>> loadDrinks() async {
        final file = await this._getLocalFile();
        final string = await file.readAsString();
        final json = JsonDecoder().convert(string);
        return (json['drinks']).map<Drink>((drink) => Drink.fromJson(drink)).toList();
    }

    Future<File> saveDrinks(List<Drink> drinks) async {
        final file = await this._getLocalFile();
        return file.writeAsString(JsonEncoder().convert({
            'drinks': drinks.map((drink) => drink.toJson()).toList(),
        }));
    }

    Future<File> _getLocalFile() async {
        final dir = await this.getDirectory();
        return File('${dir.path}/${tag}.json');
    }
}
