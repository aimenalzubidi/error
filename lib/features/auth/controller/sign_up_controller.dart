// ignore_for_file: unused_local_variable

import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:graduation_project/core/error/exception.dart';
import 'package:graduation_project/features/auth/pages/SERVICES/auh_api_services.dart';
import 'package:graduation_project/features/auth/pages/sign_up.dart';
import 'package:graduation_project/features/main_app/home/pages/home_screen.dart';

class SignupController extends GetxController {
  AuthApiServices _servicess = AuthApiServices();
  String? phoneerror;
  String? passworderror;

  Future<void> createaccount({
    required String phone,
    required String password,
  }) async {
    try {
      final response = await _servicess.createacount(
        phone: phone,
        password: password,
      );
    } on Emaioalreadyusedexception {
      phoneerror = "user-not-found";
      update();
    } on Weakpasswordexception {
      passworderror = "weak-password";
      update();
    } catch (e) {
      phoneerror = "error";
      update();
    }
  }
}
