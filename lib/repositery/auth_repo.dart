import 'package:e_commerce_advance/constants/app_url.dart';

import '../services/network/network_api_service.dart';

class AuthRepo{
  NetworkApiService networkApiService = NetworkApiService();
Future<dynamic> loginUser(dynamic data)async{
try{
  final response=networkApiService.login(AppUrl.loginUrl,data
  );
  
  return response;
}catch(e){
throw e;
}

}


}