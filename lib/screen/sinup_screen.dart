import 'package:fair_pro/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class SinupScreen extends StatefulWidget {
  const SinupScreen({super.key});

  @override
  State<SinupScreen> createState() => _SinupScreenState();
}

class _SinupScreenState extends State<SinupScreen> {
  TextEditingController emailSinUpController = TextEditingController();
  TextEditingController passwordSinUpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login Now',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: TextField(
                controller: emailSinUpController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: TextField(
                controller: passwordSinUpController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async {
                      try {
                        await authServices.value.signUpWithEmailAndPassword(
                            emailSinUpController.text,
                            passwordSinUpController.text);
                        Navigator.pop(context);
                      } on FirebaseAuthException catch (e) {
                        print(e.message);
                      }

                      //     .then((user) {
                      //   if (user != null) {
                      //     // Sign-up successful, navigate to another screen or show success message
                      //     print('Sign-up successful: ${user.email}');
                      //   } else {
                      //     // Sign-up failed, show error message
                      //     print('Sign-up failed');
                      //   }
                      // });
                    },
                    child: Text('Sin Up')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
