import 'package:to_do_app_redux/model/item.dart';

class AddItemAction {
  static int _id = 0;
  final String itemTitle;

  AddItemAction(this.itemTitle) {
    _id++;
  }

  int get id => _id;
}

class RemoveItemAction {
  final Item item;

  RemoveItemAction(this.item);
}

class RemoveItemsAction {}

class GetItemsAction {}

class LoadedItemsAction {
  final List<Item> items;

  LoadedItemsAction(this.items);
}

class ItemCompletedAction {
  final Item item;

  ItemCompletedAction(this.item);
}
