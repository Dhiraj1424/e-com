import 'package:e_commerce_advance/constants/string.dart';

extension EmailValidation on String {
  bool isEmailValid() {
    RegExp emailReg = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    bool isValid = emailReg.hasMatch(this);
    return isValid;
  }
}

extension FormValidation on String? {
  String? fieldValidate(String label) {
    if (this == null || this!.isEmpty) {
      return '${AppString.pleaseEnter} $label.';
    }
    return null;
  }
}

extension PasswordValidation on String {
  bool? validatePassword(String password) {
    final val = this;

    if (val.length > 6) {
      return false;
    } else if (startsWith('97') || startsWith('98')) {
      return true;
    }
    return false;
  }
}

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return '';
    } else {
      return this!;
    }
  }
}
