import 'package:firebase_project/ui/widgets/RegExpressions.dart';
import 'package:get/get.dart';

class CommonFunctions {
  static String? emailValidation(String value) {
    if (!GetStringUtils(value).isEmail) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  static String? nameValidation(String value) {
    if (RegExpression.validateSpecialCharacter(value)) {
      return "Name should not contain special characters";
    } else if (RegExpression.validateAtLeastOneDigit(value)) {
      return "Name should not contain numbers";
    } else {
      return null;
    }
  }
}
