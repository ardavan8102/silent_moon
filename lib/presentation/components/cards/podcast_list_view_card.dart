import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:silent_moon/consts/colors.dart';
import 'package:silent_moon/core/models/podcasts/podcast_list_models/podcast_result.dart';
import 'package:silent_moon/presentation/components/containers/empty_image_state.dart';

class PodcastListViewCard extends StatelessWidget {
  final PodcastResponseResult podcast;
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
          CachedNetworkImage(
            height: size.height * .15,
            width: size.width * .5,
            imageUrl: podcast.cover,
            imageBuilder: (context, imageProvider) {
              return Container(
                height: 150,
                width: size.width * .5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: .cover,
                    alignment: .center
                  ),
                  borderRadius: .circular(20)
                ),
              );
            },
            placeholder: (context, url) {
              return const CircularProgressIndicator(
                color: AppSolidColors.primary,
              );
            },
            errorWidget: (context, url, error) => EmptyImageStateContainer(),
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
    );
  }
}