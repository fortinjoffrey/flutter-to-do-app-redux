import 'package:to_do_app_redux/model/app_state.dart';
import 'package:to_do_app_redux/model/item.dart';
import 'package:to_do_app_redux/redux/actions.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    items: itemReducer(state.items, action),
  );
}

List<Item> itemReducer(List<Item> items, action) {
  if (action is AddItemAction) {
    return []
      ..addAll(items)
      ..add(Item(id: action.id, title: action.itemTitle));
  }

  if (action is RemoveItemAction) {
    return List.unmodifiable(List.from(items)..remove(action.item));
  }

  if (action is RemoveItemsAction) {
    return List.unmodifiable([]);
  }

  if (action is LoadedItemsActions) {
    return action.items;
  }

  return items;
}
