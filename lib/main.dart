import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

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
    final Store<AppState> store = Store<AppState>(
      appStateReducer,
      initialState: AppState.initialState(),
    );

    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

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
    );
  }
}
