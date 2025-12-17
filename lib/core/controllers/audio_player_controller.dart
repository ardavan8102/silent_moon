import 'package:get/get.dart' hide Rx;
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:silent_moon/core/models/music/position_data.dart';
import 'package:silent_moon/core/models/single_podcast/podcast_episode_model.dart';

class AudioPlayerController extends GetxController {
  final AudioPlayer player = AudioPlayer();

  final currentEpisode = Rxn<PodcastEpisode>();
  final isPlaying = false.obs;

  Stream<PositionData> get positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        player.positionStream,
        player.bufferedPositionStream,
        player.durationStream,
        (position, buffered, duration) => PositionData(
          position: position,
          bufferedPosition: buffered,
          duration: duration ?? Duration.zero,
        ),
      );

  @override
  void onInit() {
    super.onInit();
    player.playerStateStream.listen((state) {
      isPlaying.value = state.playing;
    });
  }

  Future<void> togglePlayPause(PodcastEpisode episode) async {
    if (currentEpisode.value?.id != episode.id) {
      await player.setUrl(episode.audioUrl);
      currentEpisode.value = episode;
      await player.play();
      return;
    }

    player.playing ? await player.pause() : await player.play();
  }

  Future<void> rewind10() async {
    final current = player.position;
    final target = current - const Duration(seconds: 10);

    await seek(target < Duration.zero ? Duration.zero : target);
  }

  Future<void> forward10() async {
    final current = player.position;
    final duration = player.duration ?? Duration.zero;

    final target = current + const Duration(seconds: 10);

    await seek(target > duration ? duration : target);
  }

  Future<void> seek(Duration d) async => player.seek(d);

  @override
  void onClose() {
    player.dispose();
    super.onClose();
  }
}
