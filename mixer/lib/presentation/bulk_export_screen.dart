import 'package:flutter/material.dart';

import 'package:mixer/models/models.dart';
import 'package:mixer/middleware/file_storage.dart';

class BulkExportScreen extends StatelessWidget {
    final List<Drink> drinks;

    BulkExportScreen({
        this.drinks,
    });

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("Bulk Export"),
            ),
            body: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                    children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: SingleChildScrollView(
                                child: SelectableText(FileStorage.dumpString(this.drinks)),
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}
