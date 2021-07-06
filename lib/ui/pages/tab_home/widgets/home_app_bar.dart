import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/app_dimens.dart';
import 'package:flutter_app/ui/widgets/images/app_cache_image.dart';

class HomeAppBar extends AppBar {
  HomeAppBar({
    Key? key,
    String avatarUrl = "",
    VoidCallback? onSearchPressed,
    VoidCallback? onSettingPressed,
  }) : super(
          key: key,
          title: Text("Movie"),
          leading: Container(
              child: Center(
            child: AppCircleAvatar(
              url: avatarUrl,
              size: 40,
            ),
          )),
          toolbarHeight: AppDimens.appBarHeight,
          actions: [
            IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.search,
                )),
            IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.more_vert,
                )),
          ],
        );
}
