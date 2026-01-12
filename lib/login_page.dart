import 'package:fair_pro/phone_login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fair_pro/auth_controller.dart';

class LoginPage extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _authController.signInWithGoogle(),
              child: Text('Sign in with Google'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Get.to(() => PhoneLoginPage()),
              child: Text('Sign in with Phone'),
            ),
          ],
        ),
      ),
    );
  }
}
