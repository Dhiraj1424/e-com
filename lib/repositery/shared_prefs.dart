import 'package:e_commerce_advance/model/token_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs with ChangeNotifier {
  Future saveUser(TokenModel tokenModel) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', tokenModel.token.toString());
    notifyListeners();
    return true;
  }

  Future<TokenModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    notifyListeners();
    return TokenModel(token: token.toString());
    
  }

  Future removeUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    sp.clear();
    notifyListeners();
    return true;
  }
}
