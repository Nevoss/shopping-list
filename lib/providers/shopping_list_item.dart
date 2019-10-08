import 'package:flutter/cupertino.dart';

class ShoppingListItem with ChangeNotifier {
  final String id;
  final String title;
  final String group;
  bool checked = false;

  ShoppingListItem({
    this.id,
    this.title,
    this.group,
    this.checked = false,
  });
}
