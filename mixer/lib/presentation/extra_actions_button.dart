import 'package:flutter/material.dart';
import 'package:mixer/models/extra_actions.dart';
import 'package:mixer/util/routes.dart';
import 'package:mixer/util/keys.dart';

class ExtraActionsButton extends StatelessWidget {

    ExtraActionsButton({Key key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return PopupMenuButton<ExtraAction>(
            onSelected: (ExtraAction action) {
                String route;
                if (action == ExtraAction.BulkImport) {
                    route = AppRoute.BulkImport;
                }
                else {
                    route = AppRoute.BulkExport;
                }
                Navigator.of(context).pushNamed(route);
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
                ];
            },
        );
    }
}
