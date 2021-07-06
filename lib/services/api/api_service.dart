import 'package:flutter_app/configs/app_configs.dart';
import 'package:flutter_app/model/entities/index.dart';
import 'package:flutter_app/model/response/array_response.dart';
import 'package:flutter_app/networks/api_client.dart';
import 'package:flutter_app/networks/api_util.dart';
import 'package:get/get.dart';

part 'auth_api.dart';

part 'movie_api.dart';

part 'notification_api.dart';

class ApiService extends GetxService {
  late ApiClient _apiClient;

  Future<ApiService> init() async {
    _apiClient = ApiUtil.getApiClient();
    return this;
  }
}
