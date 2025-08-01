import 'package:flutter/material.dart';
import 'package:imthon6/view/widgets/video_widget.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 29, 78),
      body: VideoWidget(),
    );
  }
}
