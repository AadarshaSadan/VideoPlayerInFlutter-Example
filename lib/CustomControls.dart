import 'package:appvideo/VideoSelectionPage.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class CustomControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chewieController = ChewieController.of(context);
    return Stack(
      children: [
        if (chewieController!.showControls)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black54,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(chewieController.videoPlayerController.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow),
                    color: Colors.white,
                    onPressed: () {
                      chewieController.videoPlayerController.value.isPlaying
                          ? chewieController.videoPlayerController.pause()
                          : chewieController.videoPlayerController.play();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.fast_rewind),
                    color: Colors.white,
                    onPressed: () {
                      final position = chewieController.videoPlayerController.value.position;
                      final newPosition = position - Duration(seconds: 10);
                      chewieController.videoPlayerController.seekTo(newPosition);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.fast_forward),
                    color: Colors.white,
                    onPressed: () {
                      final position = chewieController.videoPlayerController.value.position;
                      final newPosition = position + Duration(seconds: 10);
                      chewieController.videoPlayerController.seekTo(newPosition);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.fullscreen),
                    color: Colors.white,
                    onPressed: () {
                      chewieController.enterFullScreen();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.fullscreen_exit),
                    color: Colors.white,
                    onPressed: () {
                      chewieController.exitFullScreen();
                    },
                  ),
                ],
              ),
            ),
          ),
        Align(
          alignment: Alignment.bottomCenter,
          child: VideoProgressIndicator(
            chewieController.videoPlayerController,
            allowScrubbing: true,
            colors: VideoProgressColors(
              playedColor: Colors.red,
              bufferedColor: Colors.white,
              backgroundColor: Colors.grey,
            ),
          ),
        ),
        if (chewieController.isFullScreen)
          Positioned(
            top: 40.0,
            right: 20.0,
            child: IconButton(
              icon: Icon(Icons.fullscreen_exit),
              color: Colors.white,
              onPressed: () {
                // chewieController.exitFullScreen();

                chewieController.exitFullScreen();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => VideoSelectionPage()),
                      (route) => false, // Removes all routes below the new route
                );
              },
            ),
          ),
      ],
    );
  }
}
