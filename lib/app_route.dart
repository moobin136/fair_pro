import 'package:fair_pro/home_viwer.dart';
import 'package:get/get.dart';

class AppRoute  {
  static String home = '/home';

  static List<GetPage> getPage =[
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: home, page: () => HomeScreen()),
  ];

}