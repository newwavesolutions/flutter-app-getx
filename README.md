# flutter-app boilerplate

This repo is a boilerplate to create flutter application easily. It is based on **GetX**. More info about [GetX](https://pub.dev/packages/get) here. The app has been setup to work with [retrofit](https://pub.dev/packages/retrofit), [dio](https://pub.dev/packages/dio), [json_annotation](https://pub.dev/packages/json_annotation), [intl_utils](https://pub.dev/packages/intl_utils) and [shimmer](https://pub.dev/packages/shimmer)

## Getting Started
1. Install [Flutter SDK](https://flutter.dev/docs/get-started/install). Require Flutter 2.0
2. Install plugins in Android Studio 
    * [Dart Data Class](https://plugins.jetbrains.com/plugin/12429-dart-data-class)
    * [Flutter Intl](https://plugins.jetbrains.com/plugin/13666-flutter-intl)
    * [GetX](https://plugins.jetbrains.com/plugin/15919-getx)
4. Clone the repo.
5. Run `flutter pub get`
6. Run `flutter pub run intl_utils:generate`
7. Run `flutter pub run build_runner build --delete-conflicting-outputs`
8. Run app.

## File structure

```
assets
└───font
└───image
    └───2.0x
    └───3.0x

libs
└───common
│   └───app_colors.dart
│   └───app_dimens.dart
│   └───app_images.dart
│   └───app_shadows.dart
│   └───app_text_styles.dart
│   └───app_themes.dart
└───configs
│   └───app_configs.dart
└───database
│   └───secure_storage_helper.dart
│   └───shared_preferences_helper.dart
│   └─── ...
└───l10n
└───models
│   └───entities
│   │   └───user_entity.dart
│   │   └─── ...
│   └───enums
│   │   └───load_status.dart
│   │   └─── ...
│   └───params
│   │   └───sign_up_param.dart
│   │   └─── ...
│   └───response
│       └───array_response.dart
│       └───object_response.dart
└───networks
│   └───api_client.dart
│   └───api_interceptors.dart
│   └───api_util.dart
└───router
│   └───route_config.dart
└───services
│   └───api
│   └───store
│   └───auth_service.dart
│   └───cache_service.dart
│   └───setting_service.dart
└───ui
│   └───commons
│   │   └───app_bottom_sheet.dart
│   │   └───app_dialog.dart
│   │   └───app_snackbar.dart
│   │   └───...
│   └───pages
│   │   └───splash
│   │   │   └───splash_logic.dart
│   │   │   └───splash_state.dart
│   │   │   └───splash_view.dart
│   │   └───...
│   └───widget
│       └───appbar
│       └───buttons
│       │   └───app_button.dart
│       │   └───app_icon_button.dart
│       │   └───...
│       └───images
│       │   └───app_cache_image.dart
│       │   └───app_circle_avatar.dart
│       └───textfields
│       └───shimmer
│       └───...
└───utils
│   └───date_utils.dart
│   └───file_utils.dart
│   └───logger.dart
│   └───utils.dart
└───main.dart
```
### main.dart
The "entry point" of program.
In general, `main.dart` contain **AppMaterial**, but this repo use **GetMaterialApp** whichs has the default MaterialApp as a child.
### assets
This folder is to store static assests like fonts and images.
### common
### configs
This folder hold the config of your applications.
### database
### l10n
This folder contain all localized string. [See more](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)
### models
### networks
### router
This folder contain the route navigation
### services
This folder contain all GetxService or any service which can not be removed from memory.
### ui
### utils

## How to use
### Creating a screen.
All screen should be created in the `ui/pages` folder
User the [GetX](https://github.com/CNAD666/getx_template) plugin to create new screen.
#### Example: MovieSection
**Logic:** `movies_section_logic.dart`
```java=
class MoviesSectionLogic extends GetxController {
  final state = MoviesSectionState();
  final apiService = Get.find<ApiService>();

  void fetchInitialMovies() async {
    state.loadMovieStatus.value = LoadStatus.loading;
    try {
      final result = await apiService.getMovies(page: 1);
      state.loadMovieStatus.value = LoadStatus.success;
      state.movies.value = result.results;
      state.page.value = result.page;
      state.totalPages.value = result.totalPages;
    } catch (e) {
      state.loadMovieStatus.value = LoadStatus.failure;
    }
  }
  ...
}
```
**State:** `movies_section_state.dart`
```java=
class MoviesSectionState {
  final loadMovieStatus = LoadStatus.initial.obs;
  final movies = <MovieEntity>[].obs;
  final page = 1.obs;
  final totalResults = 0.obs;
  final totalPages = 0.obs;
  ...
}
```
**View:** `movies_section_view.dart`
```java=
class MoviesSectionPage extends StatefulWidget {...}

class _MoviesSectionPageState extends State<MoviesSectionPage> {
  final MoviesSectionLogic logic = Get.put(MoviesSectionLogic());
  final MoviesSectionState state = Get.find<MoviesSectionLogic>().state;
  
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (state.loadMovieStatus.value == LoadStatus.loading) {
        return _buildLoadingList();
      } else if (state.loadMovieStatus.value == LoadStatus.failure) {
        return Container();
      } else {
        return _buildSuccessList(
          state.movies,
          showLoadingMore: !state.hasReachedMax,
        );
      }
    });
  }
}
```

### Creating api service.
1. Create entity object in folder `lib/models/entities`
Ex: `movie_entity.dart`
```java=
import 'package:json_annotation/json_annotation.dart';

part 'movie_entity.g.dart';

@JsonSerializable()
class MovieEntity {
  @JsonKey()
  String? title;
  ...
    
  factory MovieEntity.fromJson(Map<String, dynamic> json) => _$MovieEntityFromJson(json);
  Map<String, dynamic> toJson() => _$MovieEntityToJson(this);
}
```
Class must have `@JsonSerializable()` for generator. Read [json_serializable](https://pub.dev/packages/json_serializable)

2. Define and Generate your API in file `lib/networks/api_client.dart`
Ex: GET movies
```java=
  /// Movie
  @GET("/3/discover/movie")
  Future<ArrayResponse<MovieEntity>> getMovies(@Query('api_key') String apiKey, @Query('page') int page);
```
Note: Using **ArrayResponse** and **ObjectResponse** for generic response

3. Require run command line: 
```
flutter pub run build_runner build --delete-conflicting-outputs
```

4. Create api service file for your feature in folder `lib/services/api` 
Ex: `movies_api.dart`
```java=
part of 'api_service.dart';

extension MovieApiService on ApiService {
  Future<ArrayResponse<MovieEntity>> getMovies({int page = 1}) async {
    return _apiClient.getMovies(MovieAPIConfig.APIKey, page);
  }
}
```
After, add `part 'auth_api.dart';` to `services/api/api_service`

5. You can call API in the logic of screen.
Ex:
```java=
  final apiService = Get.find<ApiService>();
  final result = await apiService.getMovies(page: 1);
```

### Support multiple Theme and Language
See **SettingService** class for more detail
![](https://i.imgur.com/2DUnGpZ.png)


### Other
#### Logger
```java=
logger.d("message"); //"💙 DEBUG: message"
logger.i("message"); //"💚 INFO: message"
logger.e("message"); //"❤️ ERROR: message"
logger.log("very very very long message");
```
#### Snackbar
```java=
AppSnackbar.showInfo(message: 'Info');
AppSnackbar.showWarning(message: 'Warning');
AppSnackbar.showError(message: 'Error');
```
#### Dialog
```java=
AppDialog.defaultDialog(
          message: "An error happened. Please check your connection!",
          textConfirm: "Retry",
          onConfirm: () {
            //Do something
          },
);
```
#### Button UI when call API
```java=
return Obx(() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: AppTintButton(
          title: 'Sign In',
          onPressed: _signIn,
          isLoading: state.signInStatus.value == LoadStatus.loading,
        ),
    );
});
```

## Refer
https://github.com/CNAD666/getx_template/blob/main/docs/Use%20of%20Flutter%20GetX---simple%20charm!.md
https://pub.dev/documentation/get/latest/
