import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends AppBar {
  AppBarWidget({
    Key? key,
    VoidCallback? onBackPressed,
    String title = "",
    List<Widget> rightActions = const [],
  }) : super(
          key: key,
          title: Text(title),
          toolbarHeight: 50,
          leading: IconButton(onPressed: onBackPressed, icon: Icon(Icons.arrow_back_ios_rounded)),
          actions: rightActions,
        );
}
