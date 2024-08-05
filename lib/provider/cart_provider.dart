import 'package:ecommerce_ui/models/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  final List<Products> _cart = [];

  List<Products> get cart => _cart;

  void toggleProduct(Products product) {
    if (_cart.contains(product)) {
      for (Products element in _cart) {
        element.quantity++;
      }
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

  incrementQuantity(int index) => cart[index].quantity++;

  decrementQuantity(index) => cart[index].quantity--;
  getTotalPrice(){
    double total =0.0;
    for (Products element in _cart){
      total += element.price * element.quantity;
    }
    return total;
  }

  static CartProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<CartProvider>(context, listen: listen);
  }
}
