import 'package:e_commerce_advance/constants/app_url.dart';

import '../model/home_model.dart';
import '../model/single_product.dart';
import '../services/network/network_api_service.dart';

class SingleProducts {
  NetworkApiService networkApiService = NetworkApiService();

  Future<ProductModel> getProductById(int id) async {
    ProductModel singleProduct;
    try {
      final response = await networkApiService
          .getProductById('https://fakestoreapi.com/products/$id');
      singleProduct = ProductModel.fromJson(response);
      return singleProduct;
    } catch (e) {
      throw e.toString();
    }
  }
}
