import 'package:audio_service/audio_service.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/constans/colors.dart';
import 'package:musicapp/locator.dart';
import '../../../../services/Controllers/audio_player_handler.dart';

class SongProgress extends StatelessWidget {
  final Duration totalDuration;
  final AudioPlayerHandler songHandler = locator.get<AudioPlayerHandler>();

  SongProgress({
    super.key,
    required this.totalDuration,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Duration>(
      stream: songHandler.audioPlayer.positionStream,
      builder: (context, positionSnapshot) {
        // Retrieve the current position from the stream
        Duration position = positionSnapshot.data ?? Duration.zero;

        return StreamBuilder<Duration?>(
          stream: songHandler.audioPlayer.durationStream,
          builder: (context, durationSnapshot) {
            // Retrieve the total duration from the stream
            Duration total = durationSnapshot.data ?? totalDuration;

            return ProgressBar(
              baseBarColor: MyColors.myGreyLight,
              progressBarColor: MyColors.myOrange,
              progress: position,
              total: total,
              onSeek: (position) {
                songHandler.seek(position);
              },
              barHeight: 5,
              thumbRadius: 2.5,
              thumbGlowRadius: 5,
              timeLabelLocation: TimeLabelLocation.below,
              timeLabelPadding: 10,
            );
          },
        );
      },
    );
  }
}
