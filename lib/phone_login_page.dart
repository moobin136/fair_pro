import 'package:fair_pro/auth_controller.dart';
import 'package:fair_pro/otp_verification_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneLoginPage extends StatelessWidget {
  final AuthController _authController = Get.find();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _authController.phoneAuth(_phoneController.text.trim());
                Get.to(() => OTPVerificationPage());
              },
              child: Text('Send OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
