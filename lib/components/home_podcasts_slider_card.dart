import 'package:flutter/material.dart';
import 'package:silent_moon/consts/colors.dart';
import 'package:silent_moon/gen/assets.gen.dart';
import 'package:silent_moon/models/slider_model.dart';

class HomePodcastsSliderCard extends StatelessWidget {
  final SliderModel item;
  const HomePodcastsSliderCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
      width: double.infinity,
      height: .infinity,
      decoration: BoxDecoration(
        color: item.color,
        borderRadius: .circular(20),
        image: DecorationImage(
          image: AssetImage(Assets.images.banners.sliderHomeBg.path),
          fit: .cover
        )
      ),
      child: Row(
        crossAxisAlignment: .center,
        mainAxisAlignment: .spaceBetween,
        children: [
          // Texts
          Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .start,
            spacing: 10,
            children: [
              Text(
                item.title,
                style: textTheme.labelLarge!.copyWith(
                  color: AppSolidColors.lightText,
                ),
              ),

              Row(
                children: [
                  Text(
                    '${item.category} • ',
                    style: textTheme.labelSmall!.copyWith(
                      color: AppSolidColors.lightText,
                    ),
                  ),

                  Text(
                    item.duration,
                    style: textTheme.labelSmall!.copyWith(
                      color: AppSolidColors.lightText,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Play Icon
          Icon(
            Icons.play_circle,
            size: 50,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}