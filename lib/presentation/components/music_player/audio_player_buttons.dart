import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silent_moon/consts/colors.dart';
import 'package:silent_moon/core/controllers/audio_player_controller.dart';
import 'package:silent_moon/core/models/single_podcast/podcast_episode_model.dart';
import 'package:silent_moon/presentation/components/icon/icon_button.dart';

class AudioPlayerButtonControlls extends StatelessWidget {
  const AudioPlayerButtonControlls({
    super.key,
    required AudioPlayerController playerController,
    required this.episode,
  }) : _playerController = playerController;

  final AudioPlayerController _playerController;
  final PodcastEpisode episode;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: .spaceAround,
        children: [
      
          CustomIconButton(
            icon: Icons.forward_10,
            bgColor: Colors.white,
            iconColor: AppSolidColors.primary,
            function: () => _playerController.rewind10(),
            height: 50,
            width: 50,
            iconSize: 28,
          ),
      
          CustomIconButton(
            icon: _playerController.isPlaying.value
              ? Icons.pause
              : Icons.play_arrow,
            bgColor: Colors.white,
            iconColor: AppSolidColors.primary,
            function: () => _playerController.togglePlayPause(episode),
            height: 64,
            width: 64,
            iconSize: 36,
          ),
      
          CustomIconButton(
            icon: Icons.replay_10,
            bgColor: Colors.white,
            iconColor: AppSolidColors.primary,
            function: () => _playerController.forward10(),
            height: 50,
            width: 50,
            iconSize: 28,
          ),
        ],
      ),
    );
  }
}