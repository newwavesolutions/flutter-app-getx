import 'package:flutter/material.dart';
import 'package:flutter_app/ui/pages/tab_home/home_tab_view.dart';
import 'package:flutter_app/ui/pages/tab_profile/profile_tab_view.dart';
import 'package:get/get.dart';

class MainState {
  ///Select index- responsive
  late RxInt selectedIndex;

  ///PageView page
  late List<Widget> pageList;
  late PageController pageController;

  MainState() {
    //Initialize index
    selectedIndex = 0.obs;
    //PageView page
    pageList = [
      HomeTabPage(),
      Container(color: Colors.green),
      Container(color: Colors.red),
      Container(color: Colors.green),
      ProfileTabPage(),
    ];
    //Page controller
    pageController = PageController();
  }
}
