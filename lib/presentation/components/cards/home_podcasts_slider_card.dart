import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:silent_moon/consts/colors.dart';
import 'package:silent_moon/core/models/podcast_list_models/podcast_result.dart';

class HomePodcastsSliderCard extends StatelessWidget {
  final PodcastResponseResult item;
  const HomePodcastsSliderCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        borderRadius: .circular(20),
        image: DecorationImage(
          //image: NetworkImage(item.cover),
          image: CachedNetworkImageProvider(
            maxHeight: (size.height * .14).toInt(),
            maxWidth: size.width.toInt(),
            item.cover,
          ),
          fit: .cover
        )
      ),
      child: Container(
        width: double.infinity,
        height: .infinity,
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
        decoration: BoxDecoration(
          borderRadius: .circular(20),
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Colors.black.withValues(alpha: .2)
            ],
            begin: .bottomCenter,
            end: .topCenter
          )
        ),
        child: Row(
          crossAxisAlignment: .center,
          mainAxisAlignment: .spaceBetween,
          children: [
            // Texts
            Expanded(
              child: Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .start,
                spacing: 10,
                children: [
                  Text(
                    item.name,
                    style: textTheme.labelLarge!.copyWith(
                      color: AppSolidColors.lightText,
                    ),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                      
                  Flexible(
                    child: Text(
                      item.ownerName,
                      style: textTheme.labelSmall!.copyWith(
                        color: AppSolidColors.lightText,
                      ),
                      maxLines: 1,
                      overflow: .ellipsis,
                    ),
                  ),
                ],
              ),
            ),
        
            // Play Icon
            Icon(
              Icons.play_circle,
              size: 50,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}