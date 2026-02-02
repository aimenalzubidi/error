// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:graduation_project/core/error/exception.dart';


class AuthApiSecvicess {
  Future<bool> signIn({required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print("=========================");
      print(e.code);
      print("=========================");
      if (e.code == 'invalid-credential') {
        throw UserNotFoundException();
      } else if (e.code == 'wrong-password') {
        throw WrongPasswordException();
      }
    } catch (e) {
      throw Exception(e);
    }
    return true;
  }

  Future<bool> createAccount({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw WeakPasswordException();
      } else if (e.code == 'email-already-in-use') {
        throw EmailAlreadyUsedException();
      }
    } catch (e) {
      throw Exception(e);
    }
    return true;
  }

  Future<bool> getUserInfo() async {
    return FirebaseAuth.instance.currentUser?.uid != null;
  }

  Future<bool> signOut() async {
    await FirebaseAuth.instance.signOut();
    return true;
  }
}
