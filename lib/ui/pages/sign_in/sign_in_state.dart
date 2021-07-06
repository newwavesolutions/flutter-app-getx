import 'package:flutter/material.dart';
import 'package:flutter_app/model/enums/load_status.dart';
import 'package:flutter_app/ui/widgets/input/app_password_input.dart';
import 'package:get/get.dart';

class SignInState {
  late TextEditingController usernameTextController;
  late TextEditingController passwordTextController;

  late ObscureTextController obscurePasswordController;

  final signInStatus = LoadStatus.initial.obs;

  SignInState() {
    usernameTextController = TextEditingController(text: 'thoson.it@gmail.com');
    passwordTextController = TextEditingController(text: "Son@1234");
    obscurePasswordController = ObscureTextController(obscureText: true);
  }
}
