import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/shopping_list.dart';
import '../providers/shopping_lists_provider.dart';
import '../screens/shopping_list_detail_screen.dart';

class ShoppingListsListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ShoppingList item = Provider.of<ShoppingList>(context);
    final ShoppingListsProvider shoppingListsProvider =
        Provider.of<ShoppingListsProvider>(context, listen: false);

    return Dismissible(
      onDismissed: (direction) {
        shoppingListsProvider.remove(item.id);

        final scaffold = Scaffold.of(context);

        scaffold.hideCurrentSnackBar();
        scaffold.showSnackBar(
          SnackBar(
            content: Text('Shopping list removed.'),
            duration: Duration(seconds: 2),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                shoppingListsProvider.addShoppingList(
                  title: item.title,
                  description: item.description,
                );
              },
            ),
          ),
        );
      },
      direction: DismissDirection.endToStart,
      key: ValueKey(item.id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 25,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      child: Card(
        child: ListTile(
          leading: IconButton(
            icon: Icon(
              item.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () {
              item.toggleFavorite();
            },
          ),
          trailing: IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.of(context).pushNamed(
                ShoppingListDetailScreen.routeName,
                arguments: item.id,
              );
            },
          ),
          title: Text(item.title),
          subtitle: Text(item.description.isNotEmpty
              ? item.description
              : 'No desctipion.'),
        ),
      ),
    );
  }
}
