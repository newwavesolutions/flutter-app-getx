import 'package:flutter/material.dart';
import 'package:flutter_app/common/app_images.dart';
import 'package:get/get.dart';

import 'splash_logic.dart';
import 'splash_state.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashLogic logic = Get.put(SplashLogic());
  final SplashState state = Get.find<SplashLogic>().state;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    logic.checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              height: 200,
              width: 200,
              child: Image.asset(AppImages.icLogoTransparent),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<SplashLogic>();
    super.dispose();
  }
}
