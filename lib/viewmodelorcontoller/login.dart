import 'package:e_commerce_advance/model/token_model.dart';
import 'package:e_commerce_advance/repositery/shared_prefs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../repositery/auth_repo.dart';
import '../utils/utils.dart';
import '../view/home.dart';

class LoginProvider with ChangeNotifier {
  // TokenModel? tokenModel;
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _signUpLoading = false;
  bool get signUploading => _signUpLoading;
  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  AuthRepo authRepo = AuthRepo();
  Future<void> userLogin(BuildContext context, dynamic data) async {
    setLoading(true);
    authRepo.loginUser(data).then((value) {
      setLoading(false);

      final userPreference = Provider.of<SharedPrefs>(context, listen: false);
      userPreference.saveUser(TokenModel(token: value['token'].toString()));
      UtilsClass.flushBarErrorMessage('Login Successfully', context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
        if(kDebugMode){
        print(value.toString());

      }
      notifyListeners();
    }).onError((error, stackTrace) {
      setLoading(false);

      UtilsClass.flushBarErrorMessage(error.toString(), context);
      notifyListeners();
    });
  }
}
