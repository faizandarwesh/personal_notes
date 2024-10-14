import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../utils/helper_functions.dart';
import '../../home/ui/home_screen.dart';
import '../ui/login_screen.dart';

class AuthController {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Sign Out
  Future<void> signOut(BuildContext context) async {
    HelperFunctions().showLoadingDialog(context);

    await _firebaseAuth.signOut();

    // Simulate a delay to let the user see the dialog
    await Future.delayed(const Duration(seconds: 2));

    // Close the dialog
    Navigator.of(context).pop();

    // Clear the navigation stack and navigate to the login screen
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (Route<dynamic> route) => false, // Remove all previous routes
    );
  }

  // Check if a user is logged in
  User? get currentUser => _firebaseAuth.currentUser;

  Future<String?> login(
      String email, String password, BuildContext context) async {
    HelperFunctions().showLoadingDialog(context);

    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Future.delayed(const Duration(seconds: 2));

      Navigator.pop(context); // Close loading dialog

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
            (Route<dynamic> route) => false, // Remove all previous routes
      );

      return "Login successfully";
    } on FirebaseAuthException catch (e) {
      return e.message; // Return the error message
    }
  }

  Future<String?> register(
      String email, String password, BuildContext context) async {
    HelperFunctions().showLoadingDialog(context);

    try {
      UserCredential userCredentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      Future.delayed(const Duration(seconds: 2));

      Navigator.pop(context); // Close loading dialog

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
            (Route<dynamic> route) => false, // Remove all previous routes
      );

      return "Register successfully";
    } on FirebaseAuthException catch (e) {
      return e.message; // Return the error message
    }
  }
}
