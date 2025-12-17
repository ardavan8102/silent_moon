import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silent_moon/consts/colors.dart';
import 'package:silent_moon/core/controllers/audio_player_controller.dart';
import 'package:silent_moon/core/controllers/download_mp3_controller.dart';
import 'package:silent_moon/core/models/single_podcast/podcast_episode_model.dart';
import 'package:silent_moon/core/models/single_podcast/single_podcast_result.dart';
import 'package:silent_moon/gen/assets.gen.dart';
import 'package:silent_moon/presentation/components/button/download_episode_podcast_mp3.dart';
import 'package:silent_moon/presentation/components/icon/icon_button.dart';
import 'package:silent_moon/presentation/components/music_player/audio_player_buttons.dart';
import 'package:silent_moon/presentation/components/music_player/audio_player_progress_bar.dart';

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({super.key});

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> with WidgetsBindingObserver  {

  final AudioPlayerController _playerController = Get.put(AudioPlayerController());

  final DownloadMp3Controller downloadController = Get.put(DownloadMp3Controller());

  late final Rxn<SinglePodcastResult> podcast;
  late final PodcastEpisode episode;

  @override
  void initState() {
    super.initState();

    final args = Get.arguments as Map<String, dynamic>;

    podcast = args['podcast'] as Rxn<SinglePodcastResult>;
    episode = args['episode'] as PodcastEpisode;

  }

  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppSolidColors.musicPlayerBackgroundScaffold,
      body: Obx(() {
        final podcastItem = podcast.value;

        if (podcastItem == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.images.musicplayerBg.path),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                // content
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      // appbar
                      audioPlayerAppBar(),
                  
                      const SizedBox(height: 50),
                  
                      // image
                      Container(
                        width: size.width,
                        height: size.height * .3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(podcastItem.cover.image),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: .circular(15),
                        ),
                      ),
                  
                      const SizedBox(height: 24),
                  
                      // name & title
                      Text(
                        textAlign: .center,
                        episode.title,
                        maxLines: 3,
                        overflow: .ellipsis,
                        style: textTheme.labelLarge!.copyWith(
                          color: Colors.white,
                          height: 1.8
                        ),
                      ),
                  
                      const SizedBox(height: 10),
                  
                      Text(
                        textAlign: .center,
                        podcastItem.ownerName,
                        maxLines: 1,
                        overflow: .ellipsis,
                        style: textTheme.labelSmall!.copyWith(
                          fontSize: 14,
                          color: Colors.white.withValues(alpha: .7),
                        ),
                      ),
                    ],
                  ),
                ),

                // player controlls
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ClipRRect(
                    borderRadius: .only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 12,
                        sigmaY: 12,
                      ),
                      child: Container(
                        height: size.height * .25,
                        width: size.width,
                        padding: EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: .3),
                          borderRadius: .only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                        ),
                        child: Column(
                          spacing: 24,
                          children: [

                            // progress bar
                            AudioPlayerProgressBar(player: _playerController),
                      
                            // buttons
                            AudioPlayerButtonControlls(playerController: _playerController, episode: episode),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }


  Row audioPlayerAppBar() {
    return Row(
      mainAxisAlignment: .spaceBetween,
      crossAxisAlignment: .center,
      children: [
        DownloadEpisodeAudioButton(downloadController: downloadController, episode: episode),

        CustomIconButton(
          height: 50,
          width: 50,
          iconSize: 24,
          bgColor: Colors.white,
          icon: Icons.close,
          iconColor: AppSolidColors.darkBackground,
          function: () => Get.back(),
        ),
      ],
    );
  }
}