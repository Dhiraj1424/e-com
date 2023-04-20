import 'package:flutter/material.dart';
import 'package:e_commerce_advance/model/single_product.dart';

import '../model/home_model.dart';
import '../repositery/single_product.dart';

class SingleProvider with ChangeNotifier {
  ProductModel? _singleProduct;
  bool _isLoading = false;

  ProductModel? get singleProduct => _singleProduct;
  bool get isLoading => _isLoading;

  Future<ProductModel> fetchSingleProduct(int id) async {
  _isLoading = true;
  _singleProduct = await SingleProducts().getProductById(id);
  _isLoading = false;
  notifyListeners();
  return singleProduct!;
}

}

