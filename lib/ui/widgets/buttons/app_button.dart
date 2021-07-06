import 'package:flutter/material.dart';
import 'package:flutter_app/common/app_dimens.dart';

import '../app_circular_progress_indicator.dart';

class AppButton extends StatelessWidget {
  final String? title;
  final Widget? leadingIcon;
  final Widget? trailingIcon;

  final bool isLoading;

  final double? height;
  final double? width;
  final double? borderWidth;
  final double? cornerRadius;

  final Color? backgroundColor;
  final Color? borderColor;

  final TextStyle? textStyle;

  final VoidCallback? onPressed;

  AppButton({
    this.title,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.height,
    this.width,
    this.borderWidth,
    this.cornerRadius,
    this.backgroundColor,
    this.borderColor,
    this.textStyle,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? AppDimens.buttonHeight,
      width: width ?? double.infinity,
      child: ElevatedButton(
        child: _buildChildWidget(),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cornerRadius ?? AppDimens.buttonCornerRadius),
          ),
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? 0,
          ),
          primary: backgroundColor,
          padding: EdgeInsets.all(0),
        ),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildChildWidget() {
    if (isLoading) {
      return AppCircularProgressIndicator(color: Colors.white);
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          leadingIcon ?? Container(),
          title != null
              ? Text(
                  title!,
                  style: textStyle ?? TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Colors.red),
                )
              : Container(),
          trailingIcon ?? Container(),
        ],
      );
    }
  }
}
