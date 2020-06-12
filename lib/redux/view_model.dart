import 'package:redux/redux.dart';
import 'package:to_do_app_redux/model/app_state.dart';
import 'package:to_do_app_redux/model/item.dart';
import 'actions.dart';

class ViewModel {
  final List<Item> items;
  final Function(String) onAddItem;
  final Function(Item) onRemoveItem;
  final Function() onRemoveItems;

  ViewModel({
    this.items,
    this.onAddItem,
    this.onRemoveItem,
    this.onRemoveItems,
  });

  factory ViewModel.create(Store<AppState> store) {
    _onAddItem(String itemTitle) {
      store.dispatch(AddItemAction(itemTitle));
    }

    _onRemoveItem(Item item) {
      store.dispatch(RemoveItemAction(item));
    }

    _onRemoveItems() {
      store.dispatch(RemoveItemsAction());
    }

    return ViewModel(
      items: store.state.items,
      onAddItem: _onAddItem,
      onRemoveItem: _onRemoveItem,
      onRemoveItems: _onRemoveItems,
    );
  }
}
