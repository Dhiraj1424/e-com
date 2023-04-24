import 'package:flutter/material.dart';

import '../model/cart_model.dart';
import '../repositery/add_cart.dart';
import '../repositery/get_cart.dart';

class CartProvider with ChangeNotifier {
  final AddCrtRepo _addCrtRepo = AddCrtRepo();

  Future<void> addToCart(dynamic productId) async {
    _addCrtRepo.addToCart(productId);
    notifyListeners();
  }

// getting cart by cart id///////////////////////////////////////////////
  GetCart getCardById = GetCart();
  CartModel? _cartModel;
  CartModel get cartModel => _cartModel!;

  Future<CartModel> getCartByIds(dynamic id) async {
    _cartModel = await getCardById.getUserCart(id);
    notifyListeners();
    return cartModel;
  }


  ///get all cards
  
  ///
  
}
