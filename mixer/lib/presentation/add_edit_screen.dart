import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:mixer/models/drink.dart';
import 'package:mixer/util/keys.dart';

typedef OnSaveCallback = Function(int id, Drink drink);

class AddEditScreen extends StatefulWidget {
    final bool isEditing;
    final OnSaveCallback onSave;
    final Drink drink;

    AddEditScreen({
        Key key,
        @required this.onSave,
        @required this.isEditing,
        this.drink,
    }) : super(key: key ?? MixerKeys.AddDrinkScreen);

    @override
    AddEditScreenState createState() => AddEditScreenState();
}

class AddEditScreenState extends State<AddEditScreen> {

    TextEditingController nameController = TextEditingController();
    TextEditingController primaryAlcoholController = TextEditingController();
    TextEditingController preferredGlassController = TextEditingController();
    TextEditingController instructionsController = TextEditingController();

    TextEditingController ingredientsController = TextEditingController();
    FocusNode ingredientsFocus = FocusNode();

    List<String> _ingredients = [];
    int id;

    @override
    void initState() {
        super.initState();
        if (widget.drink != null) {
            nameController.text = widget.drink.name;
            primaryAlcoholController.text = widget.drink.primary_alcohol;
            preferredGlassController.text = widget.drink.preferred_glass;
            instructionsController.text = widget.drink.instructions;
            _ingredients.addAll(widget.drink.ingredients);
            id = widget.drink.id;
        }
    }

    @override
    void dispose() {
        nameController.dispose();
        primaryAlcoholController.dispose();
        preferredGlassController.dispose();
        instructionsController.dispose();
        ingredientsController.dispose();
        ingredientsFocus.dispose();

        super.dispose();
    }

    String get titleText => widget.isEditing ? 'Edit Drink' : 'Create Drink';

    EdgeInsetsGeometry get formRowPadding {
        return EdgeInsets.only(bottom: 8.0);
    }

    Widget getSimpleField(String label, TextEditingController controller, {int numLines = 1}) {
        return Padding(
            padding: this.formRowPadding,
            child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: label,
                ),
                maxLines: numLines,
            ),
        );
    }

    Widget getIngredientsBox() {
        return Padding(
            padding: this.formRowPadding,
            child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Ingredients',
                ),
                focusNode: ingredientsFocus,
                controller: ingredientsController,
                onSubmitted: (text)
                {
                    _ingredients.add(text);
                    ingredientsController.clear();
                    FocusScope.of(context).requestFocus(ingredientsFocus);
                    setState(() {});
                }
            ),
        );
    }

    Widget getIngredientsList() {
        return Expanded(
            child: ListView.builder(
                itemCount: _ingredients.length,
                itemBuilder: (context, index) {
                    return Dismissible(
                        key: Key(_ingredients[index]),
                        background: Container(
                            color: Colors.red,
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                ),
                                child: Row(
                                    children: <Widget>[
                                        Spacer(),
                                        Icon(Icons.delete),
                                    ],
                                ),
                            ),
                        ),
                        onDismissed: (direction)
                        {
                            setState(()
                            {
                                _ingredients.removeAt(index);
                            });
                        },
                        child: ListTile(
                            title: Text(_ingredients[index]),
                        ),
                    );
                },
            ),
        );
    }

    @override
    Widget build(BuildContext) {
        return Scaffold(
            appBar: AppBar(
                title: Text(this.titleText),
                backgroundColor: Colors.black87,
            ),
            body: Container(
                child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 25.0,
                    ),
                    child: Column(
                        children: <Widget> [
                            this.getSimpleField('Name', nameController),
                            this.getSimpleField('Primary Alcohol', primaryAlcoholController),
                            this.getSimpleField('Preferred Glass', preferredGlassController),
                            this.getSimpleField('Instructions', instructionsController, numLines:2),
                            this.getIngredientsBox(),
                            this.getIngredientsList(),
                        ],
                    ),
                )
            ),
            floatingActionButton: Builder(
                builder: (context) {
                    return FloatingActionButton(
                        onPressed: () => submitDrink(context),
                        child: Icon(Icons.check),
                    );
                }
            ),
        );
    }

    void submitDrink(BuildContext context) {
        List<FormCheck> checks = [
            FormCheck(
                () => nameController.text.isNotEmpty,
                'Must have a name',
            ),
            FormCheck(
                () => primaryAlcoholController.text.isNotEmpty,
                'Must have a primary alcohol',
            ),
            FormCheck(
                () => preferredGlassController.text.isNotEmpty,
                'Must have a preferred glass',
            ),
            FormCheck(
                () => _ingredients.length > 0,
                'Must have ingredients',
            ),

        ];

        bool allValid = true;
        for (int i = 0; i < checks.length; i++) {
            FormCheck check = checks[i];
            if (!check.func()) {
                allValid = false;
                this.showErrorSnackbar(context, check.message);
                break;
            }
        }
        if (allValid){
            Drink newDrink = Drink(
                this.id,
                this.nameController.text,
                this.primaryAlcoholController.text,
                this.preferredGlassController.text,
                this._ingredients,
                this.instructionsController.text,
            );
            widget.onSave(null, newDrink);
            Navigator.pop(context);
        }
    }

    void showErrorSnackbar(BuildContext context, String message) {
        Scaffold.of(context).showSnackBar(
            SnackBar(
                backgroundColor: Colors.redAccent,
                content: Text(message),
            ),
        );
    }
}

class FormCheck {
    final Function func;
    final String message;

    FormCheck(this.func, this.message);
}
