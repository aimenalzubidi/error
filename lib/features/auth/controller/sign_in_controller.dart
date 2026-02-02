import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:graduation_project/core/error/exception.dart';
import 'package:graduation_project/features/auth/pages/SERVICES/auh_api_services.dart';
import 'package:graduation_project/features/main_app/home/pages/home_screen.dart';

class SignInController extends GetxController {
  final AuthApiServices _servicess = AuthApiServices();
  String? phoneerror;
  String? passworderror;

  Future<void> signIn({required String phone, required String password}) async {
    try {
      final response = await _servicess.signin(
        phone: phone,
        password: password,
      );
      if (response) {
        Get.to(() => HomeScreen());
      }
    } on Usernotfoundexception {
      phoneerror = "user-not-found";
      update();
    } on Wrongpasswordexception {
      passworderror = "wrong-password";
      update();
    } catch (e) {
      phoneerror = "error";
      update();
    }
  }
}
