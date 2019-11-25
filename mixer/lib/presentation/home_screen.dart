import 'package:flutter/material.dart';

import 'package:mixer/containers/sorted_drinks.dart';
import 'package:mixer/util/routes.dart';


class HomeScreen extends StatefulWidget {

    final void Function() onInit;

    HomeScreen({
        Key key,
        @required this.onInit,
    }) : super(key: key);

    @override
    HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

    @override
    void initState() {
        widget.onInit();
        super.initState();
    }

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
                onPressed: () {
                    Navigator.of(context).pushNamed(AppRoute.AddDrink);
                },
                child: Icon(Icons.add),
            ),
        );
    }
}
