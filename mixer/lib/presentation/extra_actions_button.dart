import 'package:flutter/material.dart';

import 'package:mixer/models/extra_actions.dart';
import 'package:mixer/models/app_state.dart';
import 'package:mixer/util/routes.dart';
import 'package:mixer/util/keys.dart';
import 'package:mixer/actions/loading_actions.dart';

import 'package:flutter_redux/flutter_redux.dart';


class ExtraActionsButton extends StatelessWidget {

    ExtraActionsButton({Key key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return PopupMenuButton<ExtraAction>(
            onSelected: (ExtraAction action) {
                switch (action) {
                    case ExtraAction.BulkImport: {
                        Navigator.of(context).pushNamed(AppRoute.BulkImport);
                    }
                    break;

                    case ExtraAction.BulkExport: {
                        Navigator.of(context).pushNamed(AppRoute.BulkExport);
                    }
                    break;

                    case ExtraAction.ClearDrinks: {
                        StoreProvider.of<AppState>(context).dispatch(DrinksNotLoadedAction());
                    }
                    break;
                }
            },
            itemBuilder: (BuildContext context) {
                return <PopupMenuItem<ExtraAction>>[
                    PopupMenuItem<ExtraAction>(
                        key: MixerKeys.BulkImport,
                        value: ExtraAction.BulkImport,
                        child: Text('Bulk Import'),
                    ),
                    PopupMenuItem<ExtraAction>(
                        key: MixerKeys.BulkExport,
                        value: ExtraAction.BulkExport,
                        child: Text('Bulk Export'),
                    ),
                    PopupMenuItem<ExtraAction>(
                        key: MixerKeys.ClearDrinks,
                        value: ExtraAction.ClearDrinks,
                        child: Text('Clear all drinks'),
                    )
                ];
            },
        );
    }
}
