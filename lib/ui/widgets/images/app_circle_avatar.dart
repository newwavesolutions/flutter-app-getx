import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/app_images.dart';

class AppCircleAvatar extends StatelessWidget {
  final String url;
  final double? size;

  AppCircleAvatar({this.url = "", this.size});

  @override
  Widget build(BuildContext context) {
    bool isValidUrl = Uri.tryParse(url)?.isAbsolute == true;
    return Container(
      width: size ?? double.infinity,
      height: size ?? double.infinity,
      child: isValidUrl
          ? ClipRRect(
              child: CachedNetworkImage(
                imageUrl: url,
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  return Container(
                    width: size,
                    height: size,
                    child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                      strokeWidth: 2,
                    ),
                  );
                },
                errorWidget: (context, url, error) {
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(
                      AppImages.icAvatar,
                      fit: BoxFit.cover,
                    ),
                  );
                },
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular((size ?? 0) / 2),
            )
          : Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                AppImages.icAvatar,
                fit: BoxFit.cover,
              ),
            ),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular((size ?? 0) / 2),
      ),
    );
  }
}
