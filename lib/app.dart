import 'package:fair_pro/app_binding.dart';
import 'package:fair_pro/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: Colors.white,
      initialBinding: AppBinding(),
      initialRoute: AppRoute.home,
      title: 'Firebase_realtime_data_snap_short',
      getPages: AppRoute.getPage,
    );
  }
}
