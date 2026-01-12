import 'package:fair_pro/bindings/app_bindings.dart';
import 'package:fair_pro/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.home,
      getPages: AppRoutes.routes,
      initialBinding: AppBindings(),
    );
  }
}
