import 'package:flutter/cupertino.dart';
import 'package:provider_state_management_task/models/cart_item.dart';

class CartProvider extends ChangeNotifier{
  final List<CartItem> cartItems = [];
  double totalPrice = 0.0;
  void addItem(CartItem item){
    cartItems.add(item);
    totalPrice = totalPrice + item.price;
    notifyListeners();
  }
  void removeItem(CartItem item){
    if(cartItems.contains(item)){
      cartItems.remove(item);
      totalPrice = totalPrice - item.price;
      notifyListeners();
    }
  }

}