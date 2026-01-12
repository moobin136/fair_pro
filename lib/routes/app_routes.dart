import 'package:fair_pro/ui/home_page.dart';
import 'package:get/get.dart';


class AppRoutes {
  static const String home = '/';

  static final routes = [
    GetPage(
      name: home,
      page: () => HomePage(),
    ),
  ];
}
