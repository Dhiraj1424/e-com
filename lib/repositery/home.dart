import 'package:e_commerce_advance/model/home_model.dart';
import 'package:e_commerce_advance/services/network/network_api_service.dart';

class HomeR {
  NetworkApiService networkApiService = NetworkApiService();

  Future<List<ProductModel>> getAllProduct() async {
    try {
      final response =
          await networkApiService.getAll('https://fakestoreapi.com/products');
      List dynamicList = response as List;

      if (dynamicList != null) {
        List<ProductModel> productList =
            dynamicList.map((x) => ProductModel.fromJson(x)).toList();
        return productList;
      }
    } catch (e) {
      throw e.toString();
    }

    return [];
  }

  // Future<List<ProductModel>> getAllProduct() async {
  //   List<ProductModel> myList = [];
  //   try {
  //     final response =
  //         await networkApiService.getAll('https://fakestoreapi.com/products');

  //     if (response != null) {
  //       for (var item in response) {
  //         ProductModel product = ProductModel.fromJson(item);
  //         myList.add(product);
  //       }
  //       // myList = List<ProductModel>.from(
  //       //   response.map((x) => ProductModel.fromJson(x))

  //       //   );
  //         return myList;
  //     }
  //   } catch (e) {
  //     throw e.toString();
  //   }

  //   return myList;
  // }
}
