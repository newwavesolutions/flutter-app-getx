import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  final double width;
  final double height;
  final double cornerRadius;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Color? baseColor;
  final Color? highlightColor;

  AppShimmer({
    this.width = double.infinity,
    this.height = double.infinity,
    this.cornerRadius = 0,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.baseColor,
    this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey[350]!,
      highlightColor: highlightColor ?? Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(cornerRadius),
            ),
          ),
        ),
      ),
    );
  }
}
