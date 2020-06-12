import 'package:flutter/foundation.dart';

import 'item.dart';

class AppState {
  final List<Item> items;

  AppState({
    @required this.items,
  });

  AppState.initialState() : items = List.unmodifiable(<Item>[]);
}
