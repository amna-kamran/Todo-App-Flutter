import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthHelper {
  static final GoogleSignIn googleSignIn = GoogleSignIn();
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  static Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await firebaseAuth.signInWithCredential(credential);
    }
  }

  static Future<void> signOut() async {
    try {
      await googleSignIn.disconnect();
      await firebaseAuth.signOut();
    } catch (e) {
      debugPrint('Error during sign-out: $e');
    }
  }
}
