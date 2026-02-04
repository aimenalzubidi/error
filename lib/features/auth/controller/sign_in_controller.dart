import 'package:get/get.dart';
import 'package:graduation_project/core/error/exception.dart';
import 'package:graduation_project/core/util/dialogs.dart';
import 'package:graduation_project/features/auth/pages/SERVICES/auh_api_services.dart';
import 'package:graduation_project/features/main_app/dashboard_page/dashboard_page.dart';

class SignInController extends GetxController {
  final AuthApiSecvicess _services = AuthApiSecvicess();

  String? emailError;
  String? passwordError;

  Future<void> signIn({required String email, required String password}) async {
    emailError = null;
    passwordError = null;
    update();

    if (email.isEmpty) {
      emailError = "البريد الإلكتروني مطلوب";
      update();
      return;
    }

    if (password.isEmpty) {
      passwordError = "كلمة المرور مطلوبة";
      update();
      return;
    }

    try {
      showLodign();

      await _services.signIn(email: email, password: password);


      Get.back();
      Get.offAll(() => DashboardPage());
    } on UserNotFoundException {
      Get.back();
      emailError = "هذا الحساب غير موجود";
      update();
    } on WrongPasswordException {
      Get.back();
      passwordError = "كلمة المرور غير صحيحة";
      update();
    } on InvalidEmailException {
      Get.back();
      emailError = "البريد الإلكتروني غير صالح";
      update();
    } catch (e) {
      Get.back();
      Get.snackbar("خطأ", e.toString());
    }
  }
}
