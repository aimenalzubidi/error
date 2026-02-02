import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/error/exception.dart';
import 'package:graduation_project/core/util/dialogs.dart';
import 'package:graduation_project/features/auth/pages/SERVICES/auth_api_secvicess.dart';
import 'package:graduation_project/features/main_app/dashboard_page/dashboard_page.dart';

class SignUpController extends GetxController {
  AuthApiSecvicess _secvicess = AuthApiSecvicess();

  String? emailError;
  String? passwordError;
  Future<void> createAccount({
    required String email,
    required String password,
  }) async {
    try {
      if (email.isEmpty) {
        emailError = "This field is Required";
        update();
        return;
      } else if (password.isEmpty) {
        passwordError = "This field is Required";
        update();
        return;
      }
      showLodign();
      final response = await _secvicess.createAccount(
        email: email,
        password: password,
      );

      if (response) {
        
        Get.to(() => DashboardPage());
      }
    } on EmailAlreadyUsedException {
      emailError = "The account already exists for that email.";
      update();
    } on WeakPasswordException {
      passwordError = "The password provided is too weak.";
      update();
    } catch (e) {
      emailError = "$e";
      update();
    }
    Get.to(() => DashboardPage());
  }
}
