import 'package:flutter/material.dart';
import 'package:flutter_music/pages/video/controller.dart';
import 'package:get/get.dart';

class VideoPage extends GetView<VideoController> {
  const VideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('VideoPage')),
      body: const Center(
        child: Text('VideoPage is working'),
      ),
    );
  }
}
