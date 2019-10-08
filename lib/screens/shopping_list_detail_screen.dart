import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/widgets/shopping_list_detail_list.dart';

import '../providers/shopping_lists_provider.dart';

class ShoppingListDetailScreen extends StatelessWidget {
  static const routeName = '/shopping-list-detail';

  @override
  Widget build(BuildContext context) {
    final loadedShoppingList = Provider.of<ShoppingListsProvider>(
      context,
      listen: false,
    ).find(ModalRoute.of(context).settings.arguments as String);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedShoppingList.title),
      ),
      body: ChangeNotifierProvider.value(
        value: loadedShoppingList,
        child: ShoppingListDetailList(),
      ),
    );
  }
}
