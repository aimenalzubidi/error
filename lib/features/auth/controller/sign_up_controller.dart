import 'package:graduation_project/core/error/exception.dart';
import 'package:graduation_project/core/util/dialogs.dart';
import 'package:graduation_project/features/auth/pages/SERVICES/auh_api_services.dart';
import 'package:get/get.dart';
import 'package:graduation_project/features/main_app/dashboard_page/dashboard_page.dart';

class SignUpController extends GetxController {
  final AuthApiSecvicess _services = AuthApiSecvicess();

  String? emailError;
  String? passwordError;

  Future<void> createAccount({
    required String email,
    required String password,
  }) async {
    emailError = null;
    passwordError = null;
    update();

    if (email.isEmpty) {
      emailError = "البريد الإلكتروني مطلوب";
      update();
      return;
    }

    if (!email.endsWith('@gmail.com')) {
      emailError = "البريد الإلكتروني يجب أن يكون بصيغة  صحيحة";
      update();
      return;
    }

    if (password.isEmpty) {
      passwordError = "كلمة المرور مطلوبة";
      update();
      return;
    }

    if (password.length < 6) {
      passwordError = "كلمة المرور يجب أن تكون 6 أحرف على الأقل";
      update();
      return;
    }

    try {
      showLodign();

      await _services.createAccount(email: email, password: password);

      Get.back();
      Get.offAll(() => DashboardPage());
    } on EmailAlreadyUsedException {
      Get.back();
      emailError = "هذا البريد مستخدم مسبقًا";
      update();
    } on WeakPasswordException {
      Get.back();
      passwordError = "كلمة المرور ضعيفة جدًا";
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
