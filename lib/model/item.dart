import 'package:flutter/foundation.dart';

class Item {
  final int id;
  final String title;

  Item({
    @required this.id,
    @required this.title,
  });

  Item copyWith({int id, int title}) {
    return Item(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Item.fromJson(Map json)
      : title = json['title'],
        id = json['id'];

  Map toJson() => {
        'id': id,
        'title': title,
      };
}
