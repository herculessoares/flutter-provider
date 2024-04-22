import "package:flutter/material.dart";

class CheckoutProvider extends ChangeNotifier {
  int itemsCount;
  CheckoutProvider({this.itemsCount = 0});

  addItem() {
    itemsCount++;
    notifyListeners();
  }
}
