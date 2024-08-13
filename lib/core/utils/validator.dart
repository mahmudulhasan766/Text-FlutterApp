import 'package:test_app/core/constants/strings.dart';

class Validator {
  static String? name(String? v) {
    if (v == null || v == '') {
      return "";
    }
    return null;
  }

  static String? email(String? v) {
    if (v == null || v == '') {
      return "";
    }
    if (!emailValidatorRegExp.hasMatch(v)) {
      return "";
    }
    return null;
  }

  static String? phone(String? v) {
    if (v == null || v == '') {
      return "";
    }
    if (!mobileNumberRegex.hasMatch(v)) {
      return "";
    }
    return null;
  }
}
