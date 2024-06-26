import 'package:flutter/material.dart';
import 'VideoPlayerWidget.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: VideoPlayerWidget(
        videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4', // Replace with your video URL
      ),
    );
  }
}
