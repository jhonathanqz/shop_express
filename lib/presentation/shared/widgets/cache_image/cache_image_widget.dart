import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

class CacheImageWidget extends StatelessWidget {
  const CacheImageWidget({
    Key? key,
    required this.imageUrl,
    this.iconColor = Colors.black,
    this.isVisibilityError = true,
    this.boxFit,
  }) : super(key: key);
  final String imageUrl;
  final Color iconColor;
  final bool isVisibilityError;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: boxFit ?? BoxFit.contain,
      imageUrl: imageUrl,
      maxHeightDiskCache: 160,
      maxWidthDiskCache: 160,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(
            Colors.black,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Visibility(
        visible: isVisibilityError,
        child: Icon(
          Icons.error,
          color: iconColor,
        ),
      ),
    );
  }
}
