import 'package:flutter/material.dart';
import 'package:flutter_app/common/app_text_styles.dart';

class EmptyListWidget extends StatelessWidget {
  final String text;
  final RefreshCallback? onRefresh;

  EmptyListWidget({this.text = 'Không có data', this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RefreshIndicator(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                height: 200,
                width: double.infinity,
                child: Center(
                  child: Text(
                    text,
                    style: AppTextStyle.greyS18W800,
                  ),
                ),
              );
            },
            itemCount: 1,
          ),
          onRefresh: onRefresh ?? _onRefreshData),
    );
  }

  Future<void> _onRefreshData() async {}
}
