import 'package:flutter/material.dart';
import 'package:to_do_app_redux/redux/view_model.dart';

class AddItemTextField extends StatefulWidget {
  final ViewModel model;

  const AddItemTextField(this.model, {Key key}) : super(key: key);

  @override
  _AddItemTextFieldState createState() => _AddItemTextFieldState();
}

class _AddItemTextFieldState extends State<AddItemTextField> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Add an item',
        ),
        onSubmitted: (value) {
          widget.model.onAddItem(value);
          controller.text = '';
        },
      ),
    );
  }
}
