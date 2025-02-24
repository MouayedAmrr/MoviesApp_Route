import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:route_movies_app/core/services/snack_bar_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../main.dart';
import '../routes/pages_route_name.dart';

abstract class FirebaseAuthService {
  static Future<bool> createAccount({
    required String emailAddress,
    required String password,
  }) async {
    EasyLoading.show();
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );

      SnackBarService.showSuccessMessage("Account created successfully");

      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        SnackBarService.showErrorMessage(
          e.message ?? 'The password provided is too weak.',
        );

        print('The password provided is too weak.');
        return Future.value(false);
      } else if (e.code == 'email-already-in-use') {
        SnackBarService.showErrorMessage(
          e.message ?? 'The account already exists for that email.',
        );
        print('The account already exists for that email.');
        return Future.value(false);
      }
      return Future.value(false);
    } catch (e) {
      return Future.value(false);
    }
  }

  static Future<bool> login({
    required String emailAddress,
    required String password,
  }) async {
    EasyLoading.show();
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);

      print(userCredential.credential?.accessToken);
      print(userCredential.user?.uid);

      SnackBarService.showSuccessMessage("Logged In successfully");

      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      print(e.code);
      if (e.code == 'user-not-found') {
        SnackBarService.showErrorMessage(
          e.message ?? 'No user found for that email.',
        );
        return Future.value(false);
      } else if (e.code == 'invalid-credential') {
        SnackBarService.showErrorMessage(
          e.message ?? 'Wrong password provided for that user.',
        );
        return Future.value(false);
      }
      return Future.value(false);
    } catch (e) {
      return Future.value(false);
    }
  }

  static Future signInWithGoogle() async {
    EasyLoading.show();
    await GoogleSignIn().signOut();
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    var userCred = await FirebaseAuth.instance.signInWithCredential(credential);

    EasyLoading.dismiss();
    if (userCred.user != null) {
      navigatorKey.currentState!.pushNamedAndRemoveUntil(
        PagesRouteName.layout,
        (route) => false,
      );
    }

    SnackBarService.showSuccessMessage("Logged In successfully");
    return userCred;
  }
}
