import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:silent_moon/core/models/single_podcast/podcast_episode_model.dart';

class AudioPlayerController extends GetxController {

  final AudioPlayer _player = AudioPlayer();

  final currentEpisode = Rxn<PodcastEpisode>();
  final isPlaying = false.obs;
  final position = Duration.zero.obs;
  final duration = Duration.zero.obs;


  @override
  void onInit() {

    super.onInit();
    
    _player.playerStateStream.listen((state){
      isPlaying.value = state.playing;
    });

    _player.positionStream.listen((p){
      position.value = p;
    });

    _player.durationStream.listen((d){
      if (d != null) {
        duration.value = d;
      }
    });

  }


  Future<void> playEpisode(PodcastEpisode episode) async {

    if (currentEpisode.value?.id != episode.id) {
      await _player.setUrl(episode.audioUrl);
      currentEpisode.value = episode;
    }

    _player.play();

  }


  Future<void> pause() async => _player.pause();


  Future<void> seek(Duration d) async => _player.seek(d);


  Future<void> stop() async => _player.stop();


  @override
  void onClose() {
    _player.dispose();
    super.onClose();
  }

}