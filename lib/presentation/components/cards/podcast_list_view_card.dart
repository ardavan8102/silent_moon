import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silent_moon/consts/colors.dart';
import 'package:silent_moon/core/models/podcast_list_models/podcast_result.dart';
import 'package:silent_moon/presentation/components/cached_image.dart';
import 'package:silent_moon/presentation/views/normal/singles/single_podcast_page.dart';

class PodcastListViewCard extends StatelessWidget {
  final PodcastResponseResult podcast;
  const PodcastListViewCard({super.key, required this.podcast});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: size.width * .5,
      child: GestureDetector(
        onTap: () => Get.to(() => SinglePodcastPage(slug: podcast.slug)),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            CachedThumbnailImage(
              imageUrl: podcast.cover,
              height: 150,
              width: size.width * .5,
              radius: 20,
            ),
        
            const SizedBox(height: 12),
        
            Text(
              podcast.name,
              style: textTheme.labelSmall!.copyWith(
                fontSize: 20,
                fontWeight: .bold,
                color: AppSolidColors.primary
              ),
              maxLines: 1,
              overflow: .ellipsis,
            ),
        
            Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  podcast.ownerName,
                  style: textTheme.labelSmall!.copyWith(
                    color: AppSolidColors.darkText,
                  ),
                  overflow: .ellipsis,
                  maxLines: 1,
                ),
        
                const SizedBox(height: 10),
        
                Row(
                  spacing: 6,
                  crossAxisAlignment: .center,
                  children: [
                    Icon(CupertinoIcons.heart),
        
                    Text(
                      podcast.followsCount.toString(),
                      style: textTheme.labelSmall!.copyWith(
                        color: AppSolidColors.darkText,
                      ),
                      overflow: .ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

