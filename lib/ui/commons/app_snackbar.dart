import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackbar {
  static void showInfo({String? title, String? message}) {
    Get.snackbar(
      title ?? "Info",
      message ?? "Empty message",
      backgroundColor: Colors.white,
      colorText: Colors.black,
    );
  }

  static void showWarning({String? title, String? message}) {
    Get.snackbar(
      title ?? "Warning",
      message ?? "Empty message",
      backgroundColor: Colors.amber,
      colorText: Colors.white,
    );
  }

  static void showError({String? title, String? message}) {
    Get.snackbar(
      title ?? "Error",
      message ?? "Empty message",
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}
