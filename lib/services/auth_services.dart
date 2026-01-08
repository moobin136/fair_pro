import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

ValueNotifier<AuthServices>  authServices = ValueNotifier(AuthServices()) ;

class AuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print('Error in signInWithEmailAndPassword: $e');
      return null;
    }
  }

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print('Error in signUpWithEmailAndPassword: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> updateUsername(String displayName) async {
    if (currentUser != null) {
      await currentUser!.updateDisplayName(displayName);
      await currentUser!.reload();
    }
  }

  Future<void> deleteAccount() async {
    if (currentUser != null) {
      await currentUser!.delete();
    }
  }

  Future<void> changePassword(String newPassword) async {
    if (currentUser != null) {
      await currentUser!.updatePassword(newPassword);
    }
  }

}