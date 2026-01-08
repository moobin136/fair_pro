import 'package:fair_pro/screen/password_reset_screen.dart';
import 'package:fair_pro/screen/sinup_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            SizedBox(height: 10),
            InkWell(
                onTap: () {
                  // Handle reset password action
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PasswordResetScreen()),
                  );
                },
                child: Text('Reset Password?')),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      // Handle login action
                    },
                    child: Text('Login')),
              ),
            ),
            TextButton(
              onPressed: () {
                // Handle sign up action
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SinupScreen()),
                );
              },
              child: Text('Don\'t have an account? Sign Up'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      // Handle login action
                    },
                    child: Text('Google Login')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
