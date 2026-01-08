import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';


class AuthServices {

  AuthServices._internal();

  static final AuthServices _instance = AuthServices._internal();

  factory AuthServices() => _instance;

  // Instances
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();


  User? get currentUser => _firebaseAuth.currentUser;

  // Auth state stream
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();


  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();


      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;


      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );


      final UserCredential userCredential =
      await _firebaseAuth.signInWithCredential(credential);

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print('Firebase Auth Error: ${e.code} - ${e.message}');
      return null;
    } catch (e) {
      print('Google Sign In Error: $e');
      return null;
    }
  }
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email.trim(), password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print('Sign In Error: ${e.code}');
      return null;
    }
  }

  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email.trim(), password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print('Sign Up Error: ${e.code}');
      return null;
    }
  }

  Future<bool> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email.trim());
      return true;
    } on FirebaseAuthException catch (e) {
      print('Reset Password Error: ${e.code}');
      return false;
    }
  }

  Future<bool> changePassword(String newPassword) async {
    if (currentUser == null) return false;
    try {
      await currentUser!.updatePassword(newPassword);
      return true;
    } on FirebaseAuthException catch (e) {
      print('Change Password Error: ${e.code}');
      // যদি re-authentication লাগে (যেমন recent login না থাকলে)
      if (e.code == 'requires-recent-login') {
        // তুমি ইউজারকে re-login করতে বলতে পারো
      }
      return false;
    }
  }

  // ==================== Profile Update ====================
  Future<bool> updateUsername(String displayName) async {
    if (currentUser == null) return false;
    try {
      await currentUser!.updateDisplayName(displayName);
      await currentUser!.reload();
      return true;
    } on FirebaseAuthException catch (e) {
      print('Update Name Error: ${e.code}');
      return false;
    }
  }

  // ==================== Sign Out & Delete ====================
  Future<void> signOut() async {
    await Future.wait([
      _googleSignIn.signOut(),
      _firebaseAuth.signOut(),
    ]);
  }

  Future<bool> deleteAccount() async {
    if (currentUser == null) return false;
    try {
      await currentUser!.delete();
      return true;
    } on FirebaseAuthException catch (e) {
      print('Delete Account Error: ${e.code}');
      if (e.code == 'requires-recent-login') {
        // Re-authentication দরকার – ইউজারকে আবার লগইন করাতে হবে
      }
      return false;
    }
  }
}


// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// ValueNotifier<AuthServices> authServices = ValueNotifier(AuthServices());
//
// class AuthServices {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//
//   User? get currentUser => _firebaseAuth.currentUser;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();
//
//   // ... (onno code gulo thakbe)
//
//   Future<User?> signInWithGoogle() async {
//     try {
//       // 1. Trigger the authentication flow
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//
//       if (googleUser == null) return null;
//
//       final GoogleSignInAuthentication googleAuth =
//           await googleUser.authentication;
//
//       // 3. Create a new credential
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//
//       // 4. Once signed in, return the UserCredential
//       UserCredential userCredential =
//           await _firebaseAuth.signInWithCredential(credential);
//       return userCredential.user;
//     } catch (e) {
//       print('Error in signInWithGoogle: $e');
//       return null;
//     }
//   }
//
//
//   Future<void> signOut() async {
//     await _googleSignIn.signOut();
//     await _firebaseAuth.signOut();
//   }
//
//   Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
//
//   Future<User?> signInWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       UserCredential userCredential = await _firebaseAuth
//           .signInWithEmailAndPassword(email: email, password: password);
//       return userCredential.user;
//     } catch (e) {
//       print('Error in signInWithEmailAndPassword: $e');
//       return null;
//     }
//   }
//
//   Future<User?> signUpWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       UserCredential userCredential = await _firebaseAuth
//           .createUserWithEmailAndPassword(email: email, password: password);
//       return userCredential.user;
//     } catch (e) {
//       print('Error in signUpWithEmailAndPassword: $e');
//       return null;
//     }
//   }
//
//
//
//   Future<void> resetPassword(String email) async {
//     await _firebaseAuth.sendPasswordResetEmail(email: email);
//   }
//
//   Future<void> updateUsername(String displayName) async {
//     if (currentUser != null) {
//       await currentUser!.updateDisplayName(displayName);
//       await currentUser!.reload();
//     }
//   }
//
//   Future<void> deleteAccount() async {
//     if (currentUser != null) {
//       await currentUser!.delete();
//     }
//   }
//
//   Future<void> changePassword(String newPassword) async {
//     if (currentUser != null) {
//       await currentUser!.updatePassword(newPassword);
//     }
//   }
// }
