import 'package:fair_pro/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPVerificationPage extends StatelessWidget {
  final AuthController _authController = Get.find();
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _otpController,
              decoration: InputDecoration(
                labelText: 'OTP',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _authController.signInWithOTP(_otpController.text.trim());
              },
              child: Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
