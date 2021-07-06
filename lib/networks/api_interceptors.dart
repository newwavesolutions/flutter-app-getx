import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app/services/index.dart';
import 'package:flutter_app/ui/pages/sign_in/sign_in_view.dart';
import 'package:flutter_app/utils/logger.dart';
import 'package:get/get.dart' hide Response;

class ApiInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final method = options.method;
    final uri = options.uri;
    final data = options.data;
    final authService = Get.find<AuthService>();
    final token = authService.token.value;
    if (token != null) {
      options.headers['Authorization'] = 'Bearer ${token.accessToken}';
    }
    logger.log("\n\n--------------------------------------------------------------------------------------------------------");
    if (method == 'GET') {
      logger.log("✈️ REQUEST[$method] => PATH: $uri \n Token: ${options.headers}", printFullText: true);
    } else {
      try {
        logger.log("✈️ REQUEST[$method] => PATH: $uri \n Token: ${token?.accessToken} \n DATA: ${jsonEncode(data)}", printFullText: true);
      } catch (e) {
        logger.log("✈️ REQUEST[$method] => PATH: $uri \n Token: ${token?.accessToken} \n DATA: $data", printFullText: true);
      }
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final statusCode = response.statusCode;
    final uri = response.requestOptions.uri;
    final data = jsonEncode(response.data);
    logger.log("✅ RESPONSE[$statusCode] => PATH: $uri\n DATA: $data");
    //Handle section expired
    if (response.statusCode == 401) {
      final authService = Get.find<AuthService>();
      authService.signOut();
      Get.off(SignInPage());
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final statusCode = err.response?.statusCode;
    final uri = err.requestOptions.path;
    var data = "";
    try {
      data = jsonEncode(err.response?.data);
    } catch (e) {}
    logger.log("⚠️ ERROR[$statusCode] => PATH: $uri\n DATA: $data");
    super.onError(err, handler);
  }
}
