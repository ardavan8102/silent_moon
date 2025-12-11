import 'package:flutter/material.dart';
import 'package:silent_moon/consts/colors.dart';
import 'package:silent_moon/models/podcast_model.dart';

class PodcastListViewCard extends StatelessWidget {
  final PodcastModel podcast;
  const PodcastListViewCard({super.key, required this.podcast});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: size.width * .5,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Container(
            height: 150,
            width: size.width * .5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(podcast.image!),
                fit: .cover,
                alignment: .topCenter
              ),
              borderRadius: .circular(20)
            ),
          ),

          const SizedBox(height: 12),

          Text(
            podcast.title!,
            style: textTheme.headlineLarge!.copyWith(
              fontSize: 30,
              color: AppSolidColors.primary
            ),
            maxLines: 1,
            overflow: .ellipsis,
          ),

          Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                '${podcast.publisher}',
                style: textTheme.labelSmall!.copyWith(
                  color: AppSolidColors.darkText,
                ),
                overflow: .ellipsis,
                maxLines: 1,
              ),

              Text(
                '${podcast.audioLengthSec! ~/ 60} دقیقه',
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
    );
  }
}