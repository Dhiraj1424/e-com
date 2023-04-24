import 'package:e_commerce_advance/model/cart_model.dart';

import '../constants/app_url.dart';
import '../services/network/network_api_service.dart';

class GetCart {
  NetworkApiService networkApiService = NetworkApiService();

  Future<CartModel> getUserCart(String cartId) async {
    CartModel cartModel;
    try {
      final data =
          await networkApiService.getUserCart("$AppUrl.addToCart/$cartId");

      //cartModel = CartModel.fromJson(data);

//       final items = data['products']
//           .map<Products>((e) =>
//               Products(productId: e['productId'], quantity: e['quantity']))
//           .toList();

//       return CartModel(
// //date: DateTime.parse(data['date']),
//           date: DateTime.parse(data['date']),
//           id: data['id'],
//           products: items,
//           userId: data['userId']);

// //or
      //  cartModel =CartModel.fromJson(data);
      //         return cartModel;

      //or
      cartModel = data.map((e) => CartModel.fromJson(e));
      return cartModel;
    } catch (e) {
      throw e.toString();
    }
  }
}
