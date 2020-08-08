import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// ignore: camel_case_types
class Video_Player extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlayVideo();
  }
}

class PlayVideo extends StatefulWidget {
  @override
  VideoState createState() => VideoState();
}

class VideoState extends State<PlayVideo> {
  VideoPlayerController playerController;

  @override
  void initState() {
    super.initState();
    playerController = VideoPlayerController.asset("assets/videos/UddGaye.mp4")
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade200,
      body: Center(
        child: AspectRatio(
            aspectRatio: 16 / 9,
            child: (playerController.value.initialized
                ? VideoPlayer(
                    playerController,
                  )
                : Container())),
      ),
      floatingActionButton: FloatingActionButton(
        hoverColor: Colors.amber,
        onPressed: () {
          setState(() {
            playerController.value.isPlaying
                ? playerController.pause()
                : playerController.play();
          });
        },
        child: Icon(
            playerController.value.isPlaying ? Icons.pause : Icons.play_arrow),
        backgroundColor: Colors.pinkAccent,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    playerController.dispose();
  }
}
