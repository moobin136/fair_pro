import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../generated/assets.dart';
import '../controller/auth_controller.dart';
import 'sinup_screen.dart'; // SignUpScreen

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const Spacer(),
            const Text(
              'Login',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Assets.assets.images.wallet05.image(),
            // Image.asset('',),
            const SizedBox(height: 30),
            Form(
              key: authController.formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: authController.emailController,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      border: const OutlineInputBorder(),
                      errorText: authController.emailError.value.isEmpty
                          ? null
                          : authController.emailError.value,
                    ),
                    validator: authController.validateEmail,
                    onChanged: (value) {
                      authController.validateEmail(value);
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: authController.passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: const OutlineInputBorder(),
                      errorText: authController.passwordError.value.isEmpty
                          ? null
                          : authController.passwordError.value,
                    ),
                    validator: authController.validatePassword,
                    onChanged: (value) {
                      authController.validatePassword(value);
                    },
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        authController.submitForm();
                      },
                      child:
                          const Text('Log In', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            RichText(
              text: TextSpan(
                text: "Don't have an account? ",
                style: const TextStyle(color: Colors.black87, fontSize: 16),
                children: [
                  TextSpan(
                    text: 'Sign Up',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.to(
                          () => const SignUpScreen(),
                        ); // Get.to() ব্যবহার করা হয়েছে
                      },
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF078EFD),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
