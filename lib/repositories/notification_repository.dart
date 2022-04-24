import '../configs/app_configs.dart';
import '../model/entities/notification/notification_entity.dart';
import '../model/response/array_response.dart';
import '../networks/api_client.dart';

abstract class NotificationRepository {
  Future<ArrayResponse<NotificationEntity>> getNotifications({
    int page = 1,
    int pageSize = AppConfigs.pageSizeMax,
  });

  Future<void> markRead(String id);

  Future<void> markReadAll();
}

class NotificationRepositoryImpl extends NotificationRepository {
  late ApiClient _apiClient;

  NotificationRepositoryImpl({required ApiClient apiClient}) {
    _apiClient = apiClient;
  }

  Future<ArrayResponse<NotificationEntity>> getNotifications(
      {int page = 1, int pageSize = AppConfigs.pageSizeMax}) {
    return _apiClient.getNotifications(page, pageSize);
  }

  Future<void> markRead(String id) {
    // TODO: implement markRead
    throw UnimplementedError();
  }

  Future<void> markReadAll() {
    // TODO: implement markReadAll
    throw UnimplementedError();
  }
}
