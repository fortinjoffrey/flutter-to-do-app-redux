import 'package:flutter/foundation.dart';

class Item {
  final int id;
  final String title;
  final bool completed;

  Item({
    @required this.id,
    @required this.title,
    this.completed = false,
  });

  Item copyWith({int id, int title, bool completed}) {
    return Item(
      id: id ?? this.id, 
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }

  Item.fromJson(Map json)
      : title = json['title'],
        id = json['id'],
        completed = json['completed'];

  Map toJson() => {
        'id': id,
        'title': title,
        'completed' : completed,
      };

   String toString() {
     return toJson().toString();
   }
}
