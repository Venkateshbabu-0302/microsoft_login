import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPodcastListView extends StatefulWidget {
  @override
  _VideoPodcastListViewState createState() => _VideoPodcastListViewState();
}

class _VideoPodcastListViewState extends State<VideoPodcastListView> {
  final List<VideoPlayerController> _controllers = [
    VideoPlayerController.network('https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4'),
    VideoPlayerController.network('https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4'),
    VideoPlayerController.network('https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4'),
    VideoPlayerController.network('https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4'),
  ];

  final List<ChewieController> _chewieControllers = [];

  bool _isPlaying = true;

  @override
  void initState() {
    super.initState();
    for (var controller in _controllers) {
      controller.initialize().then((_) {
        setState(() {});
      });
      _chewieControllers.add(
        ChewieController(
          videoPlayerController: controller,
          autoPlay: false,
          looping: false,
          showControls: true,
          customControls: MaterialControls(),
          // Show progress indicator within video
          overlay: Stack(
            children: [
              VideoPlayer(controller),
              VideoProgressIndicator(controller, allowScrubbing: true),
            ],
          ),
          // Disable playback speed changing
          allowPlaybackSpeedChanging: false,
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var chewieController in _chewieControllers) {
      chewieController.dispose();
    }
  }

  void _togglePlaying() {
    setState(() {
      _isPlaying = !_isPlaying;
      if (_isPlaying) {
        _controllers.forEach((controller) => controller.play());
      } else {
        _controllers.forEach((controller) => controller.pause());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Podcast'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _chewieControllers.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    child: Chewie(
                    controller: _chewieControllers[index],
                  ),),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}