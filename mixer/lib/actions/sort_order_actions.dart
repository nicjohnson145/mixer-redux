import 'package:mixer/models/sort_order.dart';

class UpdateSortOrderAction {
    final SortOrder sortOrder;

    UpdateSortOrderAction(this.sortOrder);

    @override
    String toString() {
        return 'UpdateSortOrderAction(sortOrder: $sortOrder)';
    }
}
