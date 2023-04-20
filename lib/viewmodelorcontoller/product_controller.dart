import 'package:flutter/material.dart';

import '../model/home_model.dart';
import '../repositery/home.dart';

class ProductProvider with ChangeNotifier {
  HomeR r = HomeR();

  List<ProductModel> productList = [];
  bool isLoading = false;
  String? errorMessage;

Future<void> fetchProducts() async {
  isLoading = true;
  try {
    productList = await r.getAllProduct();
    errorMessage = null;
    print('Data fetched successfully  ${productList[1].id}');
  } catch (e) {
    errorMessage = e.toString();
    print('Error fetching data: $errorMessage');
  }
  isLoading = false;
  notifyListeners();
}


//  Future<void> fetchProducts() async {
//   isLoading = true;
//   try {
//     productList = await r.getAllProduct();
//     errorMessage = null;
//     print('Data fetched successfully  ${productList[1].id}');
//   } catch (e) {
//     errorMessage = e.toString();
//     print('Error fetching data: $errorMessage');
//   }
//   isLoading = false;
//   notifyListeners();
// }
// Iterable<ProductModel> fetchProductById(String id){
//   return productList.where((element) => element.id==id).toList();

ProductModel fetchProductById(String id) {
  return productList.firstWhere((element) => element.id == id);
}




}






