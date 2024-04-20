import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/base/controllers/play_music_controller.dart';
import 'package:flutter_music/res/my_icon.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PlayAudioController extends StatelessWidget {
  const PlayAudioController({
    Key? key,
    this.onLoop,
    this.onPrevious,
    this.onPlay,
    this.onNext,
    this.onList,
  }) : super(key: key);

  final VoidCallback? onLoop;
  final VoidCallback? onPrevious;
  final VoidCallback? onPlay;
  final VoidCallback? onNext;
  final VoidCallback? onList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ///播放模式切换
          _buildLoop(),

          ///上一首
          _previous(),

          ///播放暂停
          _playOrPause(),

          ///下一首
          _next(),

          ///歌曲列表
          _songList(),
        ],
      ),
    );
  }

  _buildLoop() {
    return _item(
      icon: MyIcons.loop,
      size: 40,
      onTap: onLoop,
    );
  }

  _previous() {
    return _item(
      icon: MyIcons.previous,
      onTap: onPrevious,
    );
  }

  _playOrPause() {
    return GetBuilder<PlayMusicController>(
      id: 'animation',
      builder: (controller) {
        return GestureDetector(
          onTap: onPlay,
          child: CircularPercentIndicator(
            radius: 25,
            lineWidth: 1,
            percent: 1,
            progressColor: Colors.white,
            center: _item(
              icon: controller.playerState == PlayerState.playing
                  ? Icons.pause
                  : Icons.play_arrow,
            ),
          ),
        );
      },
    );
  }

  _next() {
    return _item(
      icon: MyIcons.next,
      onTap: onNext,
    );
  }

  _songList() {
    return _item(
      icon: MyIcons.list,
      onTap: onList,
    );
  }
}

Widget _item({
  double size = 30,
  VoidCallback? onTap,
  required IconData icon,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Icon(
      icon,
      size: size,
      color: Colors.white,
    ),
  );
}
