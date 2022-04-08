import 'package:dio/dio.dart';
import 'package:flutter_app/model/entities/index.dart';
import 'package:flutter_app/repositories/auth_repository.dart';
import 'package:flutter_app/ui/commons/app_dialog.dart';
import 'package:flutter_app/ui/pages/main/main_view.dart';
import 'package:flutter_app/ui/pages/sign_in/sign_in_view.dart';
import 'package:flutter_app/utils/logger.dart';
import 'package:get/get.dart';

import 'splash_state.dart';

class SplashLogic extends GetxController {
  final state = SplashState();
  final _authRepository = Get.find<AuthRepository>(tag: (AuthRepository).toString());

  void checkLogin() async {
    await Future.delayed(Duration(seconds: 2));
    final isLoggedIn = await _authRepository.isLoggedIn();
    if (!isLoggedIn) {
      Get.offAll(SignInPage());
    } else {
      try {
        //Profile
        UserEntity? myProfile = await _authRepository.getProfile();
        //Todo
        // _authRepository.updateUser(myProfile);
      } catch (error, s) {
        logger.e(error, s);
        //Check 401
        if (error is DioError) {
          if (error.response?.statusCode == 401) {
            _authRepository.signOut();
            checkLogin();
            return;
          }
        }
        AppDialog.defaultDialog(
          message: "An error happened. Please check your connection!",
          textConfirm: "Retry",
          onConfirm: () {
            checkLogin();
          },
        );
        return;
      }
      Get.offAll(MainPage());
    }
  }
}
