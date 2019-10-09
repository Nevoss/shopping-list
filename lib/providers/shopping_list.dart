import 'package:flutter/foundation.dart';
import './shopping_list_item.dart';

class ShoppingList with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  bool isFavorite;
  List<ShoppingListItem> _items = [];

  ShoppingList({
    @required this.id,
    @required this.title,
    this.description = '',
    this.isFavorite = false,
    List<ShoppingListItem> items,
  }) {
    _items = items == null ? [] : items;
  }

  void toggleFavorite() {
    isFavorite = !isFavorite;

    notifyListeners();
  }

  List<ShoppingListItem> get items {
    return [..._items];
  }

  void addItem(String title, String group) {
    _items.add(ShoppingListItem(
      id: DateTime.now().toString(),
      title: title,
      group: group,
    ));

    notifyListeners();
  }
}
