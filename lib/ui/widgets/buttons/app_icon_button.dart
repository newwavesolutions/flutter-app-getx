import 'package:flutter/material.dart';
import 'package:flutter_app/common/app_colors.dart';

import 'app_button.dart';

class AppIconButton extends AppButton {
  AppIconButton({
    String? title,
    Widget? leadingIcon,
    Widget? trailingIcon,
    bool isLoading = false,
    TextStyle? textStyle,
    Color? backgroundColor,
    VoidCallback? onPressed,
  }) : super(
          title: title,
          leadingIcon: leadingIcon,
          trailingIcon: trailingIcon,
          isLoading: isLoading,
          onPressed: onPressed,
          textStyle: textStyle,
          backgroundColor: backgroundColor,
        );
}
