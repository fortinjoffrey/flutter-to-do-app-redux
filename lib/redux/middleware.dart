import 'dart:convert';
import 'package:redux/redux.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app_redux/model/app_state.dart';
import 'package:to_do_app_redux/redux/actions.dart';

void saveToPrefs(AppState state) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var string = json.encode(state.toJson());
  await preferences.setString('itemState', string);
}

Future<AppState> loadFromPrefs() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var string = preferences.getString('itemState');

  if (string != null) {
    Map map = json.decode(string);
    return AppState.fromJson(map);
  }
  return AppState.initialState();
}

Future<void> appStateMiddleware(
    Store<AppState> store, action, NextDispatcher next) async {
  next(action);

  if (action is AddItemAction ||
      action is RemoveItemAction ||
      action is RemoveItemsAction) {
    saveToPrefs(store.state);
  }

  if (action is GetItemsAction) {
    await loadFromPrefs()
        .then((state) => store.dispatch(LoadedItemsActions(state.items)));
  }
}
