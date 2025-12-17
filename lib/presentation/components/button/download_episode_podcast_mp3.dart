import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silent_moon/consts/colors.dart';
import 'package:silent_moon/core/controllers/download_mp3_controller.dart';
import 'package:silent_moon/core/models/single_podcast/podcast_episode_model.dart';
import 'package:silent_moon/presentation/components/icon/icon_button.dart';

class DownloadEpisodeAudioButton extends StatelessWidget {
  const DownloadEpisodeAudioButton({
    super.key,
    required this.downloadController,
    required this.episode,
  });

  final DownloadMp3Controller downloadController;
  final PodcastEpisode episode;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        
        if (downloadController.isDownloading.value) {
          return Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: downloadController.progress.value,
                strokeWidth: 2,
                color: Colors.white,
              ),
              Text(
                '${(downloadController.progress.value * 100).toInt()}%',
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
            ],
          );
        }
        
        return CustomIconButton(
          height: 50,
          width: 50,
          iconSize: 24,
          bgColor: AppSolidColors.darkBackground,
          icon: Icons.download,
          iconColor: Colors.white,
          function: () {
            downloadController.downloadAudio(
              url: episode.audioUrl,
              fileName: episode.title.replaceAll('', '_')
            );
          },
        );
      } 
    );
  }
}