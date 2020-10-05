import 'package:flutter/foundation.dart';

class Cartitem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  Cartitem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, Cartitem> _items = {};
  Map<String, Cartitem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartitem) {
      total += cartitem.price * cartitem.quantity;
    });
    return total;
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId))
    //if same product alreadyExist then we will increase only quantity
    {
      _items.update(
          productId,
          (existingCartitem) => Cartitem(
              id: existingCartitem.id,
              title: existingCartitem.title,
              price: existingCartitem.price,
              quantity: existingCartitem.quantity + 1));
    } else {
      _items.putIfAbsent(
          productId,
          () => Cartitem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              quantity: 1));
    }
    notifyListeners();
  }

  void removeItem(String productid) {
    _items.remove(productid);
    notifyListeners();
  }

  void removeSingleitem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId].quantity > 1) {
      _items.update(
          productId,
          (existingCartItem) => Cartitem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity - 1,
              price: existingCartItem.price));
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    //to clear cart after pacing order
    _items = {};
    notifyListeners();
  }
}
