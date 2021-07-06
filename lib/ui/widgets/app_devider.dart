import 'package:flutter/material.dart';

class AppDivider extends Divider {
  final double? indent;
  final double? endIndent;

  AppDivider({this.indent = 0, this.endIndent = 0})
      : super(
          color: Colors.grey,
          height: 1,
          indent: indent,
          endIndent: endIndent,
        );
}
