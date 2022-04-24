import '../configs/app_configs.dart';
import '../model/entities/movie_entity.dart';
import '../model/response/array_response.dart';
import '../networks/api_client.dart';

abstract class MovieRepository {
  Future<ArrayResponse<MovieEntity>> getMovies({int page = 1});
}

class MovieRepositoryImpl extends MovieRepository {
  late ApiClient _apiClient;

  MovieRepositoryImpl({required ApiClient apiClient}) {
    _apiClient = apiClient;
  }

  Future<ArrayResponse<MovieEntity>> getMovies({int page = 1}) async {
    return _apiClient.getMovies(MovieAPIConfig.APIKey, page);
  }
}
