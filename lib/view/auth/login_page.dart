import 'package:e_commerce_advance/helper/extension.dart';
import 'package:e_commerce_advance/view/auth/widget/field.dart';
import 'package:e_commerce_advance/view/auth/widget/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:e_commerce_advance/constants/string.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../utils/utils.dart';
import '../../viewmodelorcontoller/login.dart';
import '../../widget/button.dart';
import '../home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController userController;
  late TextEditingController passwordController;
  late FocusNode userFocus;
  late FocusNode passwordFocus;

  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    userController = TextEditingController();
    userFocus = FocusNode();
    passwordFocus = FocusNode();
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<LoginProvider>(context);
        final colors = Theme.of(context);

    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
          child: Form(
        key: _key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Quara Ecommerce',
            style:colors.textTheme.titleLarge!.apply(
color: AppColors.skyBlue
            ) ,
            ),
            Padding(
              padding: EdgeInsets.all(10.sp),
              child: FieldName(
                
                  hintTexts: AppString.username,
                  labelTexts: AppString.username,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter username';
                    }
                    return null;
                  },
                  changeFocus: (val) {
                    UtilsClass.fieldFocusChange(
                        context, userFocus, passwordFocus);
                  },
                  textEController: userController,
                  focusNode: passwordFocus),
            ),
            Padding(
              padding: EdgeInsets.all(10).r,
              child: PasswordFieldName(
                  hintTexts: AppString.password,
                  labelTexts: AppString.password,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    } else if (value.length < 2) {
                      return 'Please enter password more than 2';
                    }
                    return null;
                  },
                  changeFocus: (val) {
                    UtilsClass.fieldFocusChange(
                        context, userFocus, passwordFocus);
                  },
                  textController: passwordController,
                  focusNode: userFocus),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0).r,
              child: SummitButton(
                onTap: () {
    Map<String, String> data = {
  "username": userController.text,
  "password": passwordController.text,


// Then use this data object in your API call or wherever you need to pass it as a JSON object.

};

if (_key.currentState!.validate()) {
  authProvider.userLogin(context, data);
}


                  if (_key.currentState!.validate()) {
                    authProvider.userLogin(context, data);
                  }
                },
                text: 'Submit',
              ),
            )
          ],
        ),
      )),
    ));
  }
}
