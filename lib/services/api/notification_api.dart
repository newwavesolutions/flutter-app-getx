part of 'api_service.dart';

extension NotificationApiService on ApiService {
  Future<ArrayResponse<NotificationEntity>> getNotifications({int page = 1, int pageSize = AppConfigs.pageSizeMax}) {
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
