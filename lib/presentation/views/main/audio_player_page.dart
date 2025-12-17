import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silent_moon/consts/colors.dart';
import 'package:silent_moon/core/controllers/audio_player_controller.dart';
import 'package:silent_moon/core/models/single_podcast/podcast_episode_model.dart';
import 'package:silent_moon/core/models/single_podcast/single_podcast_result.dart';
import 'package:silent_moon/gen/assets.gen.dart';
import 'package:silent_moon/presentation/components/icon/icon_button.dart';

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({super.key});

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> with WidgetsBindingObserver  {

  final _player = Get.put(() => AudioPlayerController());

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

    final podcastItem = podcast.value!;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppSolidColors.musicPlayerBackgroundScaffold,
      body: Container(
        padding: const EdgeInsets.all(24),
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.musicplayerBg.path),
            fit: .cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Appbar
              audioPlayerAppBar(),

              // Player Ui
              Container(),
            ],
          ),
        ),
      ),
    );
  }

  Row audioPlayerAppBar() {
    return Row(
      mainAxisAlignment: .spaceBetween,
      crossAxisAlignment: .center,
      children: [
        CustomIconButton(
          bgColor: AppSolidColors.darkBackground,
          icon: Icons.download,
          iconColor: Colors.white,
          function: () {
            
          },
        ),

        CustomIconButton(
          bgColor: Colors.white,
          icon: Icons.close,
          iconColor: AppSolidColors.darkBackground,
          function: () => Get.back(),
        ),
      ],
    );
  }
}

