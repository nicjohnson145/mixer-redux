import 'package:flutter/material.dart';
import 'package:mixer/models/sort_order.dart';
import 'package:mixer/util/keys.dart';


class SortOrderButton extends StatelessWidget {
    final PopupMenuItemSelected<SortOrder> onSelected;
    final SortOrder activeOrdering;

    SortOrderButton({
        Key key,
        @required this.onSelected,
        @required this.activeOrdering,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        final defaultStyle = Theme.of(context).textTheme.body1;
        final activeStyle = Theme.of(context).textTheme.body1.copyWith(
            color: Theme.of(context).accentColor,
        );

        return PopupMenuButton<SortOrder>(
            key: MixerKeys.FilterButton,
            onSelected: this.onSelected,
            itemBuilder: (BuildContext context) {
                return <PopupMenuItem<SortOrder>>[
                    PopupMenuItem<SortOrder>(
                        key: MixerKeys.NameAlphabetical,
                        value: SortOrder.Name_Alphabetical,
                        child: Text(
                            'Name',
                            style: this.activeOrdering == SortOrder.Name_Alphabetical
                                   ? activeStyle
                                   : defaultStyle,
                        ),
                    ),
                    PopupMenuItem<SortOrder>(
                        key: MixerKeys.AlcoholAlphabetical,
                        value: SortOrder.Alcohol_Alphabetical,
                        child: Text(
                            'Alcohol',
                            style: this.activeOrdering == SortOrder.Alcohol_Alphabetical
                                   ? activeStyle
                                   : defaultStyle,
                        ),
                    ),
                ];
            },
            icon: Icon(Icons.filter_list),
        );
    }
}
