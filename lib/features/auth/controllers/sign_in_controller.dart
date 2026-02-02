import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:graduation_project/core/error/exception.dart';
import 'package:graduation_project/core/util/dialogs.dart';
import 'package:graduation_project/features/auth/pages/SERVICES/auth_api_secvicess.dart';
import 'package:graduation_project/features/main_app/dashboard_page/dashboard_page.dart';

class SignInController extends GetxController {
  AuthApiSecvicess _secvicess = AuthApiSecvicess();

  String? emailError;
  String? passwordError;

  Future<void> signIn({required String email, required String password}) async {
    if (email.isEmpty) {
      emailError = "This field is Required";
      update();
      return;
    } else if (password.isEmpty) {
      passwordError = "This field is Required";
      update();
      return;
    }

    try {
      showLodign();
      final response = await _secvicess.signIn(
        email: email,
        password: password,
      );

      if (response) {
        Navigator.of(Get.overlayContext!).pop();
        Get.to(() => DashboardPage());
      }
    } on UserNotFoundException {
      emailError = "user-not-found";
      update();
      Get.back();
    } on WrongPasswordException {
      passwordError = "wrong-password";
      update();
      Get.back();
    } catch (e) {
      emailError = "$e";
      update();
      Get.back();
      Get.to(() => DashboardPage());
    }
  }

  // Future<void> signOut() async {
  //   final response = await _secvicess.signOut();

  //   if (response) {
  //     Get.offAll(() => SplashScreen());
  //   }
  // }
}
