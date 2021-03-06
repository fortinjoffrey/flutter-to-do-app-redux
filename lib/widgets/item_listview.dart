import 'package:flutter/material.dart';
import 'package:to_do_app_redux/model/item.dart';
import 'package:to_do_app_redux/redux/view_model.dart';

class ItemListView extends StatelessWidget {
  final ViewModel model;
  const ItemListView(this.model, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: model.items.length,
      itemBuilder: (context, index) {
        Item item = model.items[index];
        return ListTile(
          leading: Checkbox(
            value: item.completed,
            onChanged: (value) => model.onCompleted(item),
          ),
          title: Text(item.title),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => model.onRemoveItem(item),
          ),
        );
        // return model.items[index].
      },
    );
  }
}
