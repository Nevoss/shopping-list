import 'package:flutter/material.dart';

import './shopping_list.dart';
import './shopping_list_item.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ShoppingListsProvider with ChangeNotifier {
  List<ShoppingList> _items = [
    ShoppingList(
        id: '1',
        title: 'First one',
        description: 'This is the list of the best'),
    ShoppingList(id: '2', title: 'Two'),
    ShoppingList(id: '3', title: 'Three'),
  ];

  List<ShoppingList> get items {
    return [..._items];
  }

  List<ShoppingList> get favoriteItems {
    return items.where((item) => item.isFavorite).toList();
  }

  ShoppingList find(String id) {
    return items.firstWhere((item) => item.id == id);
  }

  void remove(String id) {
    _items.removeWhere((item) => item.id == id);

    notifyListeners();
  }

  void addShoppingList({
    String title,
    String description = '',
    bool isFavorite = false,
    List<ShoppingListItem> items,
  }) {
    _items.add(
      ShoppingList(
        title: title,
        description: description,
        isFavorite: isFavorite,
        id: DateTime.now().toString(),
        items: items,
      ),
    );

    notifyListeners();
  }
}
