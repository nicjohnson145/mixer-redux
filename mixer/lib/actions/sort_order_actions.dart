import 'package:mixer/util/enums.dart';

class UpdateSortOrderAction {
    final SortOrder sortOrder;

    UpdateSortOrderAction(this.sortOrder);

    @override
    String toString() {
        return 'UpdateSortOrderAction(sortOrder: $sortOrder)';
    }
}
