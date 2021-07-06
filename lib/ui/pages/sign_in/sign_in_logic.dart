import 'package:flutter_app/model/entities/index.dart';
import 'package:flutter_app/model/enums/load_status.dart';
import 'package:flutter_app/router/route_config.dart';
import 'package:flutter_app/services/index.dart';
import 'package:flutter_app/ui/commons/app_snackbar.dart';
import 'package:flutter_app/utils/logger.dart';
import 'package:get/get.dart';

import 'sign_in_state.dart';

class SignInLogic extends GetxController {
  final state = SignInState();
  ApiService apiService = Get.find();
  AuthService authService = Get.find();

  void signIn() async {
    final username = state.usernameTextController.text;
    final password = state.passwordTextController.text;
    if (username.isEmpty) {
      AppSnackbar.showError(message: 'Username is empty');
      return;
    }
    if (password.isEmpty) {
      AppSnackbar.showError(message: 'Password is empty');
      return;
    }
    state.signInStatus.value = LoadStatus.loading;
    try {
      final result = await apiService.signIn(username, password);
      if (result != null) {
        UserEntity? myProfile = await apiService.getProfile();
        authService.updateUser(myProfile);

        authService.saveToken(result);
        state.signInStatus.value = LoadStatus.success;
        Get.offNamed(RouteConfig.main);
      } else {
        state.signInStatus.value = LoadStatus.failure;
      }
    } catch (error) {
      logger.e(error);
      state.signInStatus.value = LoadStatus.failure;
    }
  }
}
