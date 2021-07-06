import 'package:flutter/material.dart';
import 'package:flutter_app/common/app_colors.dart';

class LoadingMoreRowWidget extends StatelessWidget {
  final double height;
  final Color color;

  LoadingMoreRowWidget({this.height = 80, this.color = AppColors.secondary});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Container(
        alignment: Alignment.center,
        child: Container(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            backgroundColor: color,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.secondary),
          ),
        ),
      ),
    );
  }
}
