import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({super.key});

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController controller;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    controller =
        VideoPlayerController.networkUrl(
            Uri.parse(
              "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
            ),
          )
          ..initialize()
              .then((_) {
                if (mounted) {
                  setState(() {});
                }
              })
              .catchError((e) {
                print("Video yuklashda xato: $e");
                if (mounted) {
                  setState(() {});
                }
              });
  }

  void video() {
    setState(() {
      isPlaying = true;
    });
    controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        height: 200,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.blue)],
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(16),
        ),
        child: isPlaying && controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller),
              )
            : Center(
                child: controller.value.isInitialized
                    ? ZoomTapAnimation(
                        onTap: video,
                        child: CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.play_arrow, size: 50),
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
              ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
