import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/app_colors.dart';
import 'package:flutter_app/common/app_images.dart';

class AppCacheImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final double? borderRadius;
  final BoxFit fit;

  AppCacheImage({
    this.url = "",
    this.width,
    this.height,
    this.borderRadius,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    bool isValidUrl = Uri.tryParse(url)?.isAbsolute == true;
    return Container(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      child: isValidUrl
          ? ClipRRect(
              child: CachedNetworkImage(
                imageUrl: url,
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  return Center(
                    child: Container(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        value: downloadProgress.progress,
                        backgroundColor: Colors.white,
                        valueColor: AlwaysStoppedAnimation<Color>(AppColors.accent),
                      ),
                    ),
                  );
                },
                errorWidget: (context, url, error) {
                  return Image.network(
                    url,
                    errorBuilder: (context, error, stackTrace) => _buildPlaceHolderImage(),
                    fit: fit,
                  );
                },
                fit: fit,
              ),
              borderRadius: BorderRadius.circular(borderRadius ?? 0),
            )
          : _buildPlaceHolderImage(),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
      ),
    );
  }

  Widget _buildPlaceHolderImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      child: Container(
        color: Color(0xFFe6e6e6),
        child: Center(
          child: Image.asset(
            AppImages.bgImagePlaceholder,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}

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
