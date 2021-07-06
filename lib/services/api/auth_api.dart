part of 'api_service.dart';

extension AuthApiService on ApiService {
  Future<TokenEntity?> signIn(String username, String password) async {
    //Todo
    await Future.delayed(Duration(seconds: 2));
    return TokenEntity(accessToken: 'app_access_token', refreshToken: 'app_refresh_token');
  }

  Future<UserEntity> getProfile() async {
    await Future.delayed(Duration(seconds: 2));
    //Todo: Mock data
    return UserEntity.mockData();
  }
}
