import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:silent_moon/consts/colors.dart';
import 'package:silent_moon/presentation/components/containers/empty_image_state.dart';

class CachedThumbnailImage extends StatelessWidget {
  const CachedThumbnailImage({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
    required this.radius,
  });

  final String imageUrl;
  final double height;
  final double width;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: .cover,
              alignment: .center,
            ),
            borderRadius: .circular(radius),
          ),
        );
      },
      placeholder: (context, url) {
        return const CircularProgressIndicator(color: AppSolidColors.primary);
      },
      errorWidget: (context, url, error) => EmptyImageStateContainer(),
    );
  }
}
