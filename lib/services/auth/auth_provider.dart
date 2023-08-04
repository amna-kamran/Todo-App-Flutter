import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:todo_app/models/auth_data.dart';

class AuthProvider {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = FirebaseFirestore.instance;

  static Future<UserCredential> register(
      String password, String email, String name) async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final data = AuthData(
        name: name,
        email: email,
      );

      await _firestore
          .collection('users')
          .doc(user.user!.uid)
          .set(data.toMap());

      return user;
    } catch (e) {
      debugPrint("Error in Auth Provider");
      debugPrint(e.toString());
      rethrow;
    }
  }

  static Future<AuthData?> login(String email, String password) async {
    try {
      final creds = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final raw =
          await _firestore.collection('users').doc(creds.user!.uid).get();

      final data = AuthData.fromMap(raw.data()!);

      return data;
    } catch (e) {
      debugPrint("Error in Auth Provider");
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<void> logout() async {
    await _auth.signOut();
  }

  static String? getCurrentUserId() {
    final User? user = FirebaseAuth.instance.currentUser;
    return user?.uid;
  }

  static String? getCurrentUserEmail() {
    final User? user = FirebaseAuth.instance.currentUser;
    return user?.email;
  }

  static storeGoogleUserInfoInFirestore() async {
    await _firestore
        .collection('users')
        .doc(getCurrentUserId())
        .set({"email": getCurrentUserEmail()});
  }
}
