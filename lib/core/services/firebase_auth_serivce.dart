import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../main.dart';
import '../routes/pages_route_name.dart';
import 'package:route_movies_app/core/services/snack_bar_service.dart';

abstract class FirebaseAuthService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  static Future<bool> createAccount({
    required String emailAddress,
    required String password,
    required String name,
    required String avatarUrl,
    required String phone,
  }) async {
    EasyLoading.show();
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      final user = userCredential.user;

      if (user != null) {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .set({
          "uid": user.uid,
          "name": name,
          "email": emailAddress,
          "phone": phone,
          "avatar": avatarUrl,
          "createdAt": FieldValue.serverTimestamp(),
        });
      }

      SnackBarService.showSuccessMessage("Account created successfully");
      return true;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      if (e.code == 'weak-password') {
        SnackBarService.showErrorMessage(
          e.message ?? 'The password provided is too weak.',
        );
      } else if (e.code == 'email-already-in-use') {
        SnackBarService.showErrorMessage(
          e.message ?? 'The account already exists for that email.',
        );
      }
      return false;
    } catch (e) {
      EasyLoading.dismiss();
      SnackBarService.showErrorMessage("Something went wrong: $e");
      return false;
    } finally {
      EasyLoading.dismiss();
    }
  }


  static Future<bool> login({
    required String emailAddress,
    required String password,
  }) async {
    EasyLoading.show();
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      SnackBarService.showSuccessMessage("Logged In successfully");
      EasyLoading.dismiss();
      return true;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      if (e.code == 'user-not-found') {
        SnackBarService.showErrorMessage(
            e.message ?? 'No user found for that email.');
        return false;
      } else if (e.code == 'invalid-credential') {
        SnackBarService.showErrorMessage(
            e.message ?? 'Wrong password provided for that user.');
        return false;
      }
      return false;
    } catch (e) {
      EasyLoading.dismiss();
      return false;
    }
  }

  static Future<UserCredential?> signInWithGoogle({
    required String avatarUrl,
  }) async {
    EasyLoading.show();
    await GoogleSignIn().signOut();

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        EasyLoading.dismiss();
        return null;
      }


      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      var userCred =
      await FirebaseAuth.instance.signInWithCredential(credential);
      final user = userCred.user;

      if (user != null) {
        final userDoc = _firestore.collection("users").doc(user.uid);

        await userDoc.set({
          "uid": user.uid,
          "email": user.email,
          "name": user.displayName ?? "",
          "avatar": avatarUrl,
          "createdAt": FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));

        navigatorKey.currentState!.pushNamedAndRemoveUntil(
          PagesRouteName.layout,
              (route) => false,
        );
      }

      SnackBarService.showSuccessMessage("Logged In successfully");
      return userCred;
    } catch (e) {
      SnackBarService.showErrorMessage("Google sign-in failed: $e");
      return null;
    } finally {
      EasyLoading.dismiss();
    }
  }
}
