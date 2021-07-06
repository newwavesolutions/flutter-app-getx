import 'package:flutter/material.dart';
import 'package:flutter_app/common/app_colors.dart';
import 'package:flutter_app/common/app_dimens.dart';
import 'package:flutter_app/common/app_text_styles.dart';
import 'package:flutter_app/ui/widgets/app_devider.dart';

class MenuItemWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  MenuItemWidget({Key? key, this.title = "", this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.only(
          left: AppDimens.marginNormal,
          top: AppDimens.paddingSmall,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Icon(
                    Icons.bookmark_outline_rounded,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      title,
                      style: theme.textTheme.bodyText1,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                  ),
                  SizedBox(width: AppDimens.paddingSmall),
                ],
              ),
            ),
            SizedBox(height: AppDimens.paddingSmall),
            AppDivider(),
          ],
        ),
      ),
    );
  }
}
