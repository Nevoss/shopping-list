import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/shopping_list_item.dart';

class ShoppingListDetailListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shoppingListItem = Provider.of<ShoppingListItem>(context);

    return Card(
      child: ListTile(
        leading: Checkbox(
          value: false,
          onChanged: (value) {},
        ),
        title: Text(shoppingListItem.title),
      ),
    );
  }
}
