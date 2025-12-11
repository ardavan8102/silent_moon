import 'package:flutter/material.dart';
import 'package:silent_moon/consts/colors.dart';
import 'package:silent_moon/gen/assets.gen.dart';
import 'package:silent_moon/models/podcast_model.dart';

class HomePodcastsSliderCard extends StatelessWidget {
  final PodcastModel item;
  const HomePodcastsSliderCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: .circular(20),
        image: DecorationImage(
          image: NetworkImage(item.image!),
          fit: .cover
        )
      ),
      child: Container(
        width: double.infinity,
        height: .infinity,
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
        decoration: BoxDecoration(
          borderRadius: .circular(20),
          image: DecorationImage(
            image: AssetImage(Assets.images.banners.sliderHomeBg.path),
            fit: .cover
          ),
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
                    item.title!,
                    style: textTheme.labelLarge!.copyWith(
                      color: AppSolidColors.lightText,
                    ),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                      
                  Flexible(
                    child: Text(
                      '${item.publisher}',
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