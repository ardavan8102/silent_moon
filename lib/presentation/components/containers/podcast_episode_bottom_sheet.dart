import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:silent_moon/consts/colors.dart';
import 'package:silent_moon/core/models/single_podcast/podcast_episode_model.dart';
import 'package:silent_moon/core/models/single_podcast/single_podcast_result.dart';
import 'package:silent_moon/core/routes/routes.dart';
import 'package:silent_moon/presentation/components/button/custom_elevated_button_icon.dart';

class EpisodesBottomSheetContainer extends StatelessWidget {
  const EpisodesBottomSheetContainer({
    super.key,
    required this.size,
    required this.episode,
    required this.index,
    required this.podcast,
  });

  final Size size;
  final PodcastEpisode episode;
  final Rxn<SinglePodcastResult> podcast;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .5,
      width: size.width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
      ),
      child: Column(
        spacing: 10,
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
    
          Text('پادکست شماره ${index + 1}'),
      
          Text(
            episode.title,
            style: TextStyle(
              fontWeight: .bold,
              height: 1.8
            ),
            textAlign: .center,
          ),
      
          const SizedBox(height: 12),
    
          // description
          Container(
            height: size.height * .2,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: .circular(15)
            ),
            child: SingleChildScrollView(
              child: HtmlWidget(episode.description)
            )
          ),
    
          const SizedBox(height: 12),
    
          // Dual Buttons
          Row(
            spacing: 15,
            children: [
              Expanded(
                child: CustomElevatedButtonWithIcon(
                  bgColor: AppSolidColors.primary,
                  foreColor: Colors.white,
                  icon: CupertinoIcons.cloud_download,
                  label: 'دانلود فایل',
                  function: () {
                    // TODO : Download file into the device
                  },
                )
              ),
          
              Expanded(
                child: CustomElevatedButtonWithIcon(
                  bgColor: AppSolidColors.primary,
                  foreColor: Colors.white,
                  icon: CupertinoIcons.headphones,
                  label: 'گوش دادن',
                  function: () {
                    Get.back();
                    Get.toNamed(
                      AppRoutes.audioPlayer,
                      arguments: {
                        'podcast' : podcast,
                        'episode' : episode,
                      },
                    );
                  },
                )
              ),
            ],
          ),
        ],
      ),
    );
  }
}