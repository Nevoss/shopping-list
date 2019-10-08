import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/shopping_lists_screen.dart';
import './screens/shopping_list_detail_screen.dart';
import './providers/shopping_lists_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => ShoppingListsProvider(),
      child: MaterialApp(
        title: 'Shopping List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ShoppingListsScreen(),
        routes: {
          ShoppingListDetailScreen.routeName: (ctx) =>
              ShoppingListDetailScreen(),
        },
      ),
    );
  }
}
