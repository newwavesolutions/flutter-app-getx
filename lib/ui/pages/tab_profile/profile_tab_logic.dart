import 'package:flutter_app/model/enums/load_status.dart';
import 'package:flutter_app/services/index.dart';
import 'package:flutter_app/ui/pages/sign_in/sign_in_view.dart';
import 'package:get/get.dart';

import 'profile_tab_state.dart';

class ProfileTabLogic extends GetxController {
  final state = ProfileTabState();

  final apiService = Get.find<ApiService>();
  final authService = Get.find<AuthService>();

  void signOut() async {
    state.signOutStatus.value = LoadStatus.loading;
    ///Call signOut API here
    await Future.delayed(Duration(seconds: 2));
    authService.signOut();
    state.signOutStatus.value = LoadStatus.success;
    Get.off(SignInPage());
  }
}
