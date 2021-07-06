import 'package:flutter/material.dart';

enum MainTab {
  home,
  discover,
  tvShows,
  watchlist,
  profile,
}

extension MainTabExtension on MainTab {
  Widget get page {
    switch (this) {
      case MainTab.home:
      // return HomeTabPage();
      // return Container(color: Colors.red,);
      case MainTab.discover:
      // return DiscoverTabPage();
      case MainTab.tvShows:
      // return TvShowTabPage();
      case MainTab.watchlist:
      // return WatchlistTabPage();
      case MainTab.profile:
      // return ProfileTabPage();
    }
    return Container();
  }

  BottomNavigationBarItem get tab {
    switch (this) {
      case MainTab.home:
        return BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home');
      case MainTab.discover:
        return BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: 'Discover');
      case MainTab.tvShows:
        return BottomNavigationBarItem(icon: Icon(Icons.tv_rounded), label: 'TV Shows');
      case MainTab.watchlist:
        return BottomNavigationBarItem(icon: Icon(Icons.bookmark_outline_rounded), label: 'Watchlist');
      case MainTab.profile:
        return BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded), label: 'Profile');
    }
  }

  String get title {
    switch (this) {
      case MainTab.home:
        return 'Home';
      case MainTab.discover:
        return 'Notification';
      case MainTab.tvShows:
        return 'TV Shows';
      case MainTab.watchlist:
        return 'Setting';
      case MainTab.profile:
        return 'Profile';
    }
    return '';
  }
}
