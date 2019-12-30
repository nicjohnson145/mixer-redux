import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mixer/presentation/home_screen.dart';


class AppRoute {
    static final String Home = '/';
    static final String AddDrink = '/addDrink';
    static final String BulkImport = '/bulkImport';
    static final String BulkExport = '/bulkExport';
}

class NoopHomeScreen {

    static MaterialPageRoute route() {
        return MaterialPageRoute(
            builder: (_) {
                return HomeScreen(
                    onInit: NoopHomeScreen.noop,
                );
            },
        );
    }

    static void noop() {}
}
