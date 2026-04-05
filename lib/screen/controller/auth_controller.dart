import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  // Real-time Error Messages
  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;

  // Email Validator (Real-time)
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      emailError.value = "Email is required";
      return emailError.value;
    }
    if (!GetUtils.isEmail(value)) {
      emailError.value = "Enter a valid email address";
      return emailError.value;
    }
    emailError.value = '';
    return null;
  }

  // Strong Password Validator (Real-time)
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      passwordError.value = "Password is required";
      return passwordError.value;
    }
    if (value.length < 8) {
      passwordError.value = "Password must be at least 8 characters";
      return passwordError.value;
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      passwordError.value = "Must contain at least 1 uppercase letter";
      return passwordError.value;
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      passwordError.value = "Must contain at least 1 lowercase letter";
      return passwordError.value;
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      passwordError.value = "Must contain at least 1 number";
      return passwordError.value;
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      passwordError.value = "Must contain at least 1 special character";
      return passwordError.value;
    }

    passwordError.value = ''; // সব ঠিক থাকলে খালি
    return null;
  }

  // Submit Function
  void submitForm() {
    if (formKey.currentState!.validate()) {
      Get.snackbar(
        "Success",
        "Login Successful ✅",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        "Error",
        "Please fix the errors ❌",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
