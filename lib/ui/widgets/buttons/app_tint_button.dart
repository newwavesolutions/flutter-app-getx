import 'package:flutter/material.dart';
import 'package:flutter_app/common/app_colors.dart';

import 'app_button.dart';

class AppTintButton extends AppButton {
  AppTintButton({
    @required String? title,
    bool isLoading = false,
    VoidCallback? onPressed,
  }) : super(
          title: title,
          isLoading: isLoading,
          onPressed: onPressed,
          textStyle: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: AppColors.buttonBGTint,
        );
}
