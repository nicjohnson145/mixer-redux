import 'package:flutter/material.dart';

import 'package:mixer/models/models.dart';
import 'package:mixer/middleware/file_storage.dart';
import 'package:mixer/presentation/home_screen.dart';
import 'package:mixer/util/routes.dart';

typedef ImportCallback = Function(Drink drink);

class BulkImportScreen extends StatefulWidget {
    final ImportCallback importFunc;

    BulkImportScreen({
        Key key,
        @required this.importFunc,
    }) : super(key: key);

    @override
    _BulkImportScreenState createState() => _BulkImportScreenState();
}

class _BulkImportScreenState extends State<BulkImportScreen> {

    TextEditingController fieldController = TextEditingController();

    @override
    void dispose() {
        fieldController.dispose();

        super.dispose();
    }

    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Bulk Import'),
            ),
            body: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                        Expanded(
                            child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Drink JSON',
                                ),
                                controller: this.fieldController,
                                maxLines: null,
                            ),
                        ),
                    ],
                ),
            ),
            floatingActionButton: Builder(
                builder: (BuildContext context) {
                    return FloatingActionButton(
                        onPressed: () {
                            List<Drink> drinks = this.parseDrinks(context);
                            if (drinks != null) {
                                for (final drink in drinks) {
                                    widget.importFunc(drink);
                                }
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    NoopHomeScreen.route(),
                                    (_) => false,
                                );
                            }
                        },
                        child: Icon(Icons.add),
                    );
                },
            ),
        );
    }

    List<Drink> parseDrinks(BuildContext context) {
        String value = this.fieldController.text;
        try {
            return FileStorage.fromString(value);
        } on FormatException catch(e) {
            Scaffold.of(context).showSnackBar(
                SnackBar(
                    backgroundColor: Colors.redAccent,
                    content: Text('Invalid input'),
                ),
            );
            return null;
        }
    }
}
