enum HomeSection {
  trendingMovies,
  trendingTvShows,
  nowPlayingMovies,
  upcomingMovies,
}

extension HomeSectionExtension on HomeSection {
  String get title {
    switch (this) {
      case HomeSection.trendingMovies:
        return "Trending";
      case HomeSection.trendingTvShows:
        return "Trending";
      case HomeSection.nowPlayingMovies:
        return "Now playing";
      case HomeSection.upcomingMovies:
        return "Upcoming";
      default:
        return "";
    }
  }

  String get typeName {
    switch (this) {
      case HomeSection.trendingMovies:
        return "Movies";
      case HomeSection.trendingTvShows:
        return "Tv Shows";
      case HomeSection.nowPlayingMovies:
        return "Movies";
      case HomeSection.upcomingMovies:
        return "Movies";
      default:
        return "";
    }
  }
}
