import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/shopping_lists_provider.dart';
import './shopping_lists_list_item.dart';

class ShoppingListsList extends StatelessWidget {
  final FilterOptions filterOptions;

  ShoppingListsList(this.filterOptions);

  @override
  Widget build(BuildContext context) {
    final shoppingListsProvider = Provider.of<ShoppingListsProvider>(context);

    final items = filterOptions == FilterOptions.Favorites
        ? shoppingListsProvider.favoriteItems
        : shoppingListsProvider.items;

    return ListView.builder(
        padding: const EdgeInsets.all(5),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) =>
            ChangeNotifierProvider.value(
              value: items[index],
              child: ShoppingListsListItem(),
            ));
  }
}
