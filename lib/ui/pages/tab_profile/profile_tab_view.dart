import 'package:flutter/material.dart';
import 'package:flutter_app/model/enums/load_status.dart';
import 'package:flutter_app/ui/pages/setting/setting_page.dart';
import 'package:flutter_app/ui/widgets/buttons/app_white_button.dart';
import 'package:flutter_app/ui/widgets/images/app_cache_image.dart';
import 'package:get/get.dart';

import 'profile_tab_logic.dart';
import 'profile_tab_state.dart';
import 'widgets/menu_header_widget.dart';
import 'widgets/menu_item_widget.dart';

class ProfileTabPage extends StatefulWidget {
  @override
  _ProfileTabPageState createState() => _ProfileTabPageState();
}

class _ProfileTabPageState extends State<ProfileTabPage> with AutomaticKeepAliveClientMixin {
  final ProfileTabLogic logic = Get.put(ProfileTabLogic());
  final ProfileTabState state = Get.find<ProfileTabLogic>().state;

  @override
  void dispose() {
    Get.delete<ProfileTabLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(
        children: [
          buildMenusWidget(),
          SizedBox(height: 10),
          buildSignOutButton(),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    final theme = Theme.of(context);
    return AppBar(
      // margin: EdgeInsets.all(20),
      // height: 60,
      // preferredSize: Size(double.infinity, 60),
      toolbarHeight: 56,
      leading: Container(
        padding: EdgeInsets.all(8),
        child: AppCircleAvatar(url: state.user.value?.avatarUrl ?? "", size: 48),
      ),
      title: Row(
        children: [
          // AppCircleAvatar(url: state.user.value?.avatarUrl ?? "", size: 60),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${state.user.value?.username ?? ""}",
                  style: theme.textTheme.headline6,
                ),
                SizedBox(width: 10),
                Text(
                  "View profile",
                  style: theme.textTheme.subtitle2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildMenusWidget() {
    return Column(
      children: [
        MenuHeaderWidget(title: "Lists"),
        // MenuItemWidget(title: "Watchlist"),
        MenuItemWidget(title: "History"),
        // MenuItemWidget(title: "Collection"),
        // MenuItemWidget(title: "Personal Lists"),
        // MenuItemWidget(title: "Reminders"),
        // MenuItemWidget(title: "Hidden Items"),
        MenuHeaderWidget(title: "Settings"),
        // MenuItemWidget(title: "Go Premium"),
        MenuItemWidget(
          title: "Settings",
          onPressed: () {
            Get.to(() => SettingPage());
          },
        ),
        MenuItemWidget(title: "Help & feedback"),
        MenuItemWidget(title: "About"),
      ],
    );
  }

  Widget buildSignOutButton() {
    return Obx(() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: AppWhiteButton(
          title: 'Logout',
          isLoading: state.signOutStatus.value == LoadStatus.loading,
          onPressed: _handleSignOut,
        ),
      );
    });
  }

  void _handleSignOut() {
    logic.signOut();
  }

  @override
  bool get wantKeepAlive => true;
}
