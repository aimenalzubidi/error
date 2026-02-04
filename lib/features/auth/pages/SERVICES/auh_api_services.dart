import 'package:firebase_auth/firebase_auth.dart';
import 'package:graduation_project/core/error/exception.dart';

class AuthApiSecvicess {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signIn({required String email, required String password}) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      if (credential.user == null) {
        throw Exception("تسجيل الدخول فشل");
      }
    } on FirebaseAuthException catch (e) {
      print(" FirebaseAuth LOGIN error: ${e.code}");

      switch (e.code) {
        case 'لا يوجد مستخدم بهذا البريد الإلكتروني':
          throw UserNotFoundException();
        case 'كلمة المرور غير صحيحة':
          throw WrongPasswordException();
        case 'ال بريد الإلكتروني غير صالح':
          throw InvalidEmailException();
        case 'غير صالح-بيانات الاعتماد':
          throw WrongPasswordException();
        default:
          throw Exception(e.message);
      }
    }
  }

  Future<void> createAccount({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      if (credential.user == null) {
        throw Exception("Account creation failed");
      }
    } on FirebaseAuthException catch (e) {
      print(" FirebaseAuth SIGNUP error: ${e.code}");

      switch (e.code) {
        case 'email-already-in-use':
          throw EmailAlreadyUsedException();
        case 'weak-password':
          throw WeakPasswordException();
        case 'invalid-email':
          throw InvalidEmailException();
        default:
          throw Exception(e.message);
      }
    }
  }
}
