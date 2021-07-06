import 'package:flutter/material.dart';
import 'package:flutter_app/common/app_colors.dart';
import 'package:flutter_app/common/app_images.dart';
import 'package:flutter_app/common/app_text_styles.dart';
import 'package:flutter_app/model/enums/load_status.dart';
import 'package:flutter_app/ui/widgets/buttons/app_tint_button.dart';
import 'package:flutter_app/ui/widgets/input/app_email_input.dart';
import 'package:flutter_app/ui/widgets/input/app_password_input.dart';
import 'package:get/get.dart';

import 'sign_in_logic.dart';
import 'sign_in_state.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final SignInLogic logic = Get.put(SignInLogic());
  final SignInState state = Get.find<SignInLogic>().state;

  @override
  void dispose() {
    Get.delete<SignInLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: buildBodyWidget(),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget buildBodyWidget() {
    final showingKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 100),
        Container(height: showingKeyboard ? 0 : 200, width: 200, child: Image.asset(AppImages.icLogoTransparent)),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: AppEmailInput(
            textEditingController: state.usernameTextController,
            labelStyle: AppTextStyle.whiteS14Bold,
            textStyle: AppTextStyle.whiteS14,
          ),
        ),
        SizedBox(height: 12),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: AppPasswordInput(
            obscureTextController: state.obscurePasswordController,
            textEditingController: state.passwordTextController,
            labelStyle: AppTextStyle.whiteS14Bold,
            textStyle: AppTextStyle.whiteS14,
            onChanged: (password) {
              //Todo
            },
          ),
        ),
        SizedBox(height: 32),
        _buildSignButton(),
      ],
    );
  }

  Widget _buildSignButton() {
    return Obx(() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: AppTintButton(
          title: 'Sign In',
          onPressed: _signIn,
          isLoading: state.signInStatus.value == LoadStatus.loading,
        ),
      );
    });
  }

  void _signIn() {
    logic.signIn();
  }
}
