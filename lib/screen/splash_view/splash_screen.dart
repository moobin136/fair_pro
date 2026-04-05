import 'package:fair_pro/core/constant/app_colors.dart';
import 'package:fair_pro/core/constant/app_images.dart';
import 'package:fair_pro/screen/auth/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goLoginScreen();
  }

  void goLoginScreen() async {
    await Future.delayed(
      const Duration(milliseconds: 1000),
      () {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double logoSize = screenHeight / 4;

    return Scaffold(
      backgroundColor: AppColors.appColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(AppImages.vectorUp),
          ),
          Center(
            child: Image.asset(
              AppImages.logo,
              fit: BoxFit.contain,
              height: logoSize,
              width: logoSize,
            ),
          ),
          Center(
            child: Column(
              children: [
                const Spacer(flex: 6),
                const CircularProgressIndicator(),
                const Spacer(flex: 1),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(AppImages.vectorDown),
          ),
        ],
      ),
    );
  }
}
