import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/locator.dart';
import 'package:musicapp/services/Controllers/audio_player_handler.dart';
import 'package:musicapp/ui/screens/player_screens/cubit/player_mini_cubit.dart';

// PlayPauseButton class responsible for displaying a play/pause button
class PlayPauseButton extends StatelessWidget {
  // SongHandler instance to control playback
  AudioPlayerHandler songHandler = locator.get<AudioPlayerHandler>();

  // Size of the button
  final double size = 30.0;

  // Constructor to initialize the PlayPauseButton
  PlayPauseButton({
    super.key,
  });

  // Build method to create the widget
  @override
  Widget build(BuildContext context) {
    // StreamBuilder listens to changes in the playback state
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () => BlocProvider.of<PlayerMiniCubit>(context).playPrev(),
          icon: const Icon(
            Icons.fast_rewind,
            size: 40,
          ),
        ),
        SizedBox(width: 25),
        _playingWidget(),
        SizedBox(width: 25),
        IconButton(
            onPressed: () =>
                BlocProvider.of<PlayerMiniCubit>(context).playNext(),
            icon: const Icon(
              Icons.fast_forward,
              size: 40,
            ))
      ],
    );
  }

  StreamBuilder<PlaybackState> _playingWidget() {
    return StreamBuilder<PlaybackState>(
      stream: songHandler.playbackState.stream,
      builder: (context, snapshot) {
        // Check if there's data in the snapshot
        if (snapshot.hasData) {
          // Retrive the playing status from the playback state
          bool playing = snapshot.data!.playing;

          // Return an IconButton that toggles play/pause on press
          return Container(
            width: 40.0, // Adjust the size of the circle
            height: 40.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white, // Set the border color
                width: 3.0, // Set the border width
              ),
            ),
            child: Center(
              child: IconButton(
                padding: EdgeInsets.zero, // Remove default padding
                constraints: BoxConstraints(), // Remove default constraints
                onPressed: () {
                  // Toggle play/pause based on the current playing status
                  if (playing) {
                    songHandler.pause();
                  } else {
                    songHandler.play();
                  }
                },
                // Display a play or pause icon based on the playing status
                icon: playing
                    ? Icon(Icons.pause_rounded, size: size)
                    : Icon(Icons.play_arrow_rounded, size: size),
              ),
            ),
          );
        } else {
          // If there's no data in the snapshot, return an empty SizedBox
          return const SizedBox.shrink();
        }
      },
    );
  }
}
