import 'package:flutter/material.dart';
import 'package:silent_moon/consts/colors.dart';
import 'package:silent_moon/core/controllers/audio_player_controller.dart';
import 'package:silent_moon/core/models/music/position_data.dart';

class AudioPlayerProgressBar extends StatelessWidget {
  const AudioPlayerProgressBar({super.key, required this.player});

  final AudioPlayerController player;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PositionData>(
      stream: player.positionDataStream,
      builder: (context, snapshot) {
        
        final data = snapshot.data;

        final position = data?.position ?? Duration.zero;
        final buffered = data?.bufferedPosition ?? Duration.zero;
        final duration = data?.duration ?? Duration.zero;

        return Column(
          crossAxisAlignment: .stretch,
          children: [
            // bar
            Stack(
              children: [
                // Buffered
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 0
                    ),
                    trackHeight: 4,
                  ), 
                  child: Slider(
                    min: 0,
                    max: duration.inMilliseconds.toDouble().clamp(1, double.infinity),
                    value: buffered.inMilliseconds.toDouble().clamp(0, duration.inMilliseconds.toDouble()),
                    onChanged: (_) {},
                    activeColor: AppSolidColors.primary.withValues(alpha: .5),
                    inactiveColor: AppSolidColors.primary.withValues(alpha: .2),
                  ),
                ),

                // Position (seek)
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 0
                    ),
                    trackHeight: 4,
                  ),
                  child: Slider(
                    min: 0,
                    max: duration.inMilliseconds.toDouble().clamp(1, double.infinity),
                    value: buffered.inMilliseconds.toDouble().clamp(0, duration.inMilliseconds.toDouble()),
                    onChanged: (value) {
                      player.seek(Duration(milliseconds: value.toInt()));
                    },
                    activeColor: Colors.white,
                    inactiveColor: Colors.transparent,
                  ),
                ),
              ],
            ),
          
            // time labels
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _format(position),
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  Text(
                    _format(duration),
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        );

      },
    );
  }

  String _format(Duration d) {
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$m:$s';
  }
}