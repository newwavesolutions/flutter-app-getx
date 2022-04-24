import '../database/secure_storage_helper.dart';
import '../model/entities/token_entity.dart';
import '../model/entities/user/user_entity.dart';
import '../networks/api_client.dart';

abstract class AuthRepository {
  Future<TokenEntity?> signIn(String username, String password);

  Future<UserEntity> getProfile();

  void saveToken(TokenEntity token);

  Future<TokenEntity?> getToken();

  void removeToken();

  Future<bool> isLoggedIn();

  void signOut();
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

  /// Handle save/remove Token
  void saveToken(TokenEntity token) {
    return SecureStorageHelper.getInstance().saveToken(token);
  }

  void removeToken() {
    return SecureStorageHelper.getInstance().removeToken();
  }

  @override
  Future<TokenEntity?> getToken() {
    return SecureStorageHelper.getInstance().getToken();
  }

  /// User
  // void updateUser(UserEntity user) {
  //   this.user.value = user;
  // }
  //
  // void deleteUser() {
  //   this.user.value = null;
  // }

  @override
  Future<bool> isLoggedIn() async {
    final token = await SecureStorageHelper.getInstance().getToken();
    return token != null;
  }

  /// SignOut
  void signOut() async {
    removeToken();
    // deleteUser();
  }
}
