import '../model/entities/token_entity.dart';
import '../model/entities/user/user_entity.dart';
import '../networks/api_client.dart';

abstract class AuthRepository {
  Future<TokenEntity?> signIn(String username, String password);

  Future<UserEntity> getProfile();
}

class AuthRepositoryImpl extends AuthRepository {
  late ApiClient _apiClient;

  AuthRepositoryImpl({required ApiClient apiClient}) {
    _apiClient = apiClient;
  }

  Future<TokenEntity?> signIn(String username, String password) async {
    await Future.delayed(Duration(seconds: 2));
    return TokenEntity(
        accessToken: 'app_access_token', refreshToken: 'app_refresh_token');
  }

  Future<UserEntity> getProfile() async {
    await Future.delayed(Duration(seconds: 2));
    //Todo: Mock data
    return UserEntity.mockData();
  }
}
