import 'package:firebase_first_project/utils/app_strings.dart';

class SignUpValidator {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return AppStrings.emailRequired;
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      return AppStrings.invalidEmail;
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return AppStrings.passwordRequired;
    }
    if (password.length < 6) {
      return AppStrings.passwordMinLength;
    }
    return null;
  }

  static String? validateConfirmPassword(
    String? password,
    String? confirmPassword,
  ) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return AppStrings.confirmPasswordRequired;
    }
    if (password != confirmPassword) {
      return AppStrings.passwordsDoNotMatch;
    }
    return null;
  }
}
