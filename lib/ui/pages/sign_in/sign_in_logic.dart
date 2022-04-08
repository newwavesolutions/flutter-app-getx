import 'package:flutter_app/model/entities/index.dart';
import 'package:flutter_app/model/enums/load_status.dart';
import 'package:flutter_app/repositories/auth_repository.dart';
import 'package:flutter_app/router/route_config.dart';
import 'package:flutter_app/ui/commons/app_snackbar.dart';
import 'package:flutter_app/utils/logger.dart';
import 'package:get/get.dart';

import 'sign_in_state.dart';

class SignInLogic extends GetxController {
  final state = SignInState();
  final _authRepository = Get.find<AuthRepository>(tag: (AuthRepository).toString());

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
      final result = await _authRepository.signIn(username, password);
      if (result != null) {
        UserEntity? myProfile = await _authRepository.getProfile();

        _authRepository.saveToken(result);
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
