import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:to_do_app_redux/redux/actions.dart';
import 'package:to_do_app_redux/redux/middleware.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';

import 'model/app_state.dart';
import 'redux/reducers.dart';
import 'redux/view_model.dart';
import 'widgets/add_item_textfield.dart';
import 'widgets/item_listview.dart';
import 'widgets/remove_items_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final DevToolsStore<AppState> store = DevToolsStore<AppState>(
      appStateReducer,
      initialState: AppState.initialState(),
      middleware: appStateMiddleware(),
    );

    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData.dark(),
          home: StoreBuilder<AppState>(
            onInit: (store) => store.dispatch(GetItemsAction()),
            builder: (BuildContext context, Store<AppState> store) {
              return Home(store);
            },
          )),
    );
  }
}

class Home extends StatelessWidget {
  final DevToolsStore<AppState> store;
  const Home(this.store, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: StoreConnector<AppState, ViewModel>(
        converter: (store) => ViewModel.create(store),
        builder: (context, viewModel) {
          return SafeArea(
            child: Column(
              children: [
                AddItemTextField(viewModel),
                Expanded(
                  child: ItemListView(viewModel),
                ),
                RemoveItemsButton(viewModel),
              ],
            ),
          );
        },
      ),
      drawer: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ReduxDevTools(store),
            ),
            RaisedButton(
              child: Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}
