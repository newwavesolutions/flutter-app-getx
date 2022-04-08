import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app/repositories/auth_repository.dart';
import 'package:flutter_app/ui/pages/sign_in/sign_in_view.dart';
import 'package:flutter_app/utils/logger.dart';
import 'package:get/get.dart' hide Response;

class ApiInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final method = options.method;
    final uri = options.uri;
    final data = options.data;
    final authRepository = Get.find<AuthRepository>(tag: (AuthRepository).toString());
    final token = await authRepository.getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer ${token.accessToken}';
    }
    apiLogger.log(
        "\n\n--------------------------------------------------------------------------------------------------------");
    if (method == 'GET') {
      apiLogger.log(
          "✈️ REQUEST[$method] => PATH: $uri \n Token: ${options.headers}",
          printFullText: true);
    } else {
      try {
        apiLogger.log(
            "✈️ REQUEST[$method] => PATH: $uri \n Token: ${token?.accessToken} \n DATA: ${jsonEncode(data)}",
            printFullText: true);
      } catch (e) {
        apiLogger.log(
            "✈️ REQUEST[$method] => PATH: $uri \n Token: ${token?.accessToken} \n DATA: $data",
            printFullText: true);
      }
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final statusCode = response.statusCode;
    final uri = response.requestOptions.uri;
    final data = jsonEncode(response.data);
    apiLogger.log("✅ RESPONSE[$statusCode] => PATH: $uri\n DATA: $data");
    //Handle section expired
    if (response.statusCode == 401) {
      final authRepository = Get.find<AuthRepository>(tag: (AuthRepository).toString());
      authRepository.signOut();
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
    apiLogger.log("⚠️ ERROR[$statusCode] => PATH: $uri\n DATA: $data");
    super.onError(err, handler);
  }
}
