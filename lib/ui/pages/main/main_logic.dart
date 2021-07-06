import 'package:get/get.dart';

import 'main_state.dart';

class MainLogic extends GetxController {
  final state = MainState();

  ///Switch tab
  void switchTap(int index) {
    state.selectedIndex.value = index;
    state.pageController.jumpToPage(index);
  }
}
