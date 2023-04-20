import 'package:e_commerce_advance/model/token_model.dart';
import 'package:e_commerce_advance/repositery/shared_prefs.dart';
import 'package:e_commerce_advance/viewmodelorcontoller/login.dart';
import 'package:flutter/material.dart';

import '../utils/routes/route_name.dart';

class CheckAuth{
Future<TokenModel> getUser()=>SharedPrefs().getUser();
void checkAuth(BuildContext context)async{
getUser().then((value) async{
if(value.token.toString()== null || value.token.toString() ==''){
  await Future.delayed(Duration(seconds: 1));
Navigator.pushNamed(context, RouteConstant.loginPage);
}
else{
Navigator.pushNamed(context, RouteConstant.navBar);

}

}).onError((error, stackTrace) => null);

}

}