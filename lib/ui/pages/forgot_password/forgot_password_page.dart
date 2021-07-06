import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/app_colors.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ForgotPasswordPageState();
  }
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CircularProgressIndicator(),
    );
  }
}
