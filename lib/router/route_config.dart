import 'package:flutter_app/ui/pages/main/main_view.dart';
import 'package:flutter_app/ui/pages/splash/splash_view.dart';
import 'package:get/get.dart';

class RouteConfig {
  ///main page
  static final String splash = "/splash";
  static final String main = "/main";

  ///Alias ​​mapping page
  static final List<GetPage> getPages = [
    GetPage(name: splash, page: () => SplashPage()),
    GetPage(name: main, page: () => MainPage()),
  ];
}
