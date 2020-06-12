import 'package:flutter/material.dart';
import 'package:to_do_app_redux/redux/view_model.dart';

class RemoveItemsButton extends StatelessWidget {
  final ViewModel model;

  const RemoveItemsButton(this.model, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Delete all items'),
      onPressed: () => model.onRemoveItems(),
    );
  }
}
