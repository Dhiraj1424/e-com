import 'package:http/http.dart';

import '../model/cart_model.dart';
import '../services/network/network_api_service.dart';

class CartRepo {
  NetworkApiService networkApiService = NetworkApiService();

// get all aveliable  card
  Future<List<CartModel>> fetchAllAvilabeCard() async {
    try {
      final response =
          await networkApiService.getAllCarts('https://fakestoreapi.com/carts');
      // return (response as List<dynamic>)
      //     .map((e) => CartModel.fromJson(e))
      //     .toList();
      final data = response as List;
      List<CartModel> cartModel =
          data.map((e) => CartModel.fromJson(e)).toList();
      return cartModel;
    } catch (e) {
      throw e.toString();
    }
  }

  // fetch all the cartBay Id

  Future<CartModel> fetchCatById(int id) async {
    try {
      final response = await networkApiService
          .getCartsBYCartId('https://fakestoreapi.com/carts/$id');
      CartModel cartModel = CartModel.fromJson(response);
      return cartModel;
    } catch (e) {
      throw e.toString();
    }
  }

//// get user cart by Date

  Future<List<CartModel>> fetchCartByDate(
      DateTime startDate, endDate, int id) async {
    try {
      final response = await networkApiService.getUserCartByDate(
          'https://fakestoreapi.com/carts/user/$id?startdate=${startDate.toString()}&enddate=${endDate.toString()}');

      final responseList = response as List;
      List<CartModel> cartModel =
          responseList.map((e) => CartModel.fromJson(e)).toList();
      return cartModel;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<CartModel>> fetchCarById(int userId) async {
    try {
      final response = await networkApiService
          .getCartsBYCartId('https://fakestoreapi.com/carts/user/$userId');

      return (response as List<dynamic>)
          .map((e) => CartModel.fromJson(e))
          .toList();
    } catch (e) {
      throw e.toString();
    }
  }

  ///add to cart
  ///
  Future<CartModel> addCart(CartModel cartsModel) async {
    try {
      final response = await networkApiService.addDataIntoCard(
          cartsModel, 'https://fakestoreapi.com/carts');
      final cartModel = CartModel.fromJson(response);
      return cartModel;
    } catch (e) {
      throw e.toString();
    }
  }

  // update Cart
  Future<CartModel> updateCart(CartModel cartModels,int id  )async{
    try{
      final response =await networkApiService.updateCart('https://fakestoreapi.com/carts/$id', cartModels);
      CartModel cartModel=CartModel.fromJson(response);
      return cartModel;
    }catch(e){
      throw e.toString();
    }
  }


}
