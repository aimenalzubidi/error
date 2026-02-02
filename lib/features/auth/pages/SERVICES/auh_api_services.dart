// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:graduation_project/core/error/exception.dart';

class AuthApiServices {
  Future<bool> signin({required String phone, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: phone,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Usernotfoundexception();
      } else if (e.code == 'wrong-password') {
        throw Wrongpasswordexception();
      }
    }
    return true;
  }

  Future<bool> createacount({
    required String phone,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: phone, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Weakpasswordexception();
      } else if (e.code == 'email-already-in-use') {
        throw Emaioalreadyusedexception();
      }
    } catch (e) {
      throw Exception(e);
    }
    return true;
  }

  Future<bool> getuserinfo() async {
    return FirebaseAuth.instance.currentUser?.uid != null;
  }
}
