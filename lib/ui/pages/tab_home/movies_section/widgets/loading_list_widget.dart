import 'package:flutter/material.dart';

import '../../../../widgets/shimmer/app_shimmer.dart';

class LoadingListWidget extends StatelessWidget {
  final double rowHeight;

  LoadingListWidget({this.rowHeight = 100});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 15),
        itemBuilder: (context, index) {
          return Container(
            height: 160,
            width: 82,
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                AppShimmer(
                  height: 122,
                  width: 82,
                  cornerRadius: 8,
                ),
                SizedBox(height: 10),
                AppShimmer(
                  height: 10,
                  width: 82,
                  cornerRadius: 8,
                ),
                SizedBox(height: 4),
                AppShimmer(
                  height: 10,
                  width: 82,
                  cornerRadius: 8,
                ),
                SizedBox(height: 4),
              ],
            ),
          );
        },
        itemCount: 20,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
