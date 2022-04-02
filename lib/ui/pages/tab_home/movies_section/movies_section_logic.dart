import 'package:flutter_app/model/enums/load_status.dart';
import 'package:get/get.dart';

import '../../../../repositories/movie_repository.dart';
import 'movies_section_state.dart';

class MoviesSectionLogic extends GetxController {
  final state = MoviesSectionState();
  final _movieRepository = Get.find<MovieRepository>();

  void fetchInitialMovies() async {
    state.loadMovieStatus.value = LoadStatus.loading;
    try {
      final result = await _movieRepository.getMovies(page: 1);
      state.loadMovieStatus.value = LoadStatus.success;
      state.movies.value = result.results;
      state.page.value = result.page;
      state.totalPages.value = result.totalPages;
    } catch (e) {
      state.loadMovieStatus.value = LoadStatus.failure;
    }
  }

  void fetchNextMovies() async {
    if (state.page.value == state.totalPages.value) {
      return;
    }
    if (state.loadMovieStatus.value != LoadStatus.success) {
      return;
    }
    state.loadMovieStatus.value = LoadStatus.loadingMore;
    try {
      final result =
          await _movieRepository.getMovies(page: state.page.value + 1);
      state.loadMovieStatus.value = LoadStatus.success;
      state.movies.value = result.results;
      state.page.value = state.page.value + result.page;
      state.page.value = result.page;
      state.totalPages.value = result.totalPages;
    } catch (e) {
      state.loadMovieStatus.value = LoadStatus.success;
    }
  }
}
