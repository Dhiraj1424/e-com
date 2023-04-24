import 'package:e_commerce_advance/repositery/shared_prefs.dart';

import '../constants/app_url.dart';
import '../services/network/network_api_service.dart';

class AddCrtRepo {
//  static const Map<String, String>headerWithToken={

// };

  NetworkApiService networkApiService = NetworkApiService();

  Future<dynamic> addToCart(dynamic data) async {
    try {
      final response = networkApiService.addCart(AppUrl.addToCart, data);
      return response;
    } catch (e) {
      throw 'this is error $e';
    }
  }
}
