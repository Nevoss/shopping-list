import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/shopping_list.dart';
import './shopping_list_detail_list_item.dart';

class ShoppingListDetailList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shoppingList = Provider.of<ShoppingList>(context);

    return ListView.builder(
      itemCount: shoppingList.items.length,
      itemBuilder: (_, index) => ChangeNotifierProvider.value(
        value: shoppingList.items[index],
        child: ShoppingListDetailListItem(),
      ),
    );
  }
}
