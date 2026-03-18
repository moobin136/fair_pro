import 'dart:convert';

import 'package:fair_pro/core/const.dart';
import 'package:fair_pro/test/test_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class TestSinUpScreen extends StatefulWidget {
  const TestSinUpScreen({super.key});

  @override
  State<TestSinUpScreen> createState() => _TestSinUpScreenState();
}

class _TestSinUpScreenState extends State<TestSinUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  void login(String email, String password) async {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          dismissDirection: DismissDirection.endToStart,
          content: Text('ইমেইল এবং পাসওয়ার্ড ফিল্ড খালি রাখা যাবে না! ⚠️'),
          backgroundColor: Color(0xFFFF200C),
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final url = Uri.parse('${Const.baseUrlAPI}/api/v1/auth/login');

      Response response = await post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'email': email.trim(),
          'password': password,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('লগইন সফল হয়েছে! ✅'),
                backgroundColor: Colors.green),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const TestHome()),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('Login Failed: ${response.statusCode}'),
                backgroundColor: Colors.red),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Error: ${e.toString()}'),
              backgroundColor: Colors.black),
        );
      }
    } finally {
      // ৩. Login shesh hole (success hok ba fail) loading bondho hobe
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              const Spacer(),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                    hintText: 'Email', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                obscureText: true, // Password hidden rakhar jonno
                decoration: const InputDecoration(
                    hintText: 'Password', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                // ৪. Loading hole Progress Indicator dekhabe, nahole Button dekhabe
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: Colors.green
                        .withOpacity(0.6), // Loading e color halka hobe
                  ),
                  onPressed: isLoading
                      ? null
                      : () =>
                          login(emailController.text, passwordController.text),
                  child: isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                              color: Colors.white, strokeWidth: 2),
                        )
                      : const Text('Login'),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
