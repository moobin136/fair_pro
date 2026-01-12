import 'package:fair_pro/auth_controller.dart';
import 'package:fair_pro/home_page.dart';
import 'package:fair_pro/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthGate extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return _authController.user.value == null ? LoginPage() : HomePage();
    });
  }
}
