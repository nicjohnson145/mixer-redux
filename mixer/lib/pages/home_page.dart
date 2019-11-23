import 'package:flutter/material.dart';
import 'package:mixer/containers/drinks/sorted_drinks.dart';

class HomePage extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Mixer'),
            ),
            body: Container(
                child: SortedDrinks(),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () => print('PRESSED'),
                child: Icon(Icons.add),
            ),
        );
    }
}
