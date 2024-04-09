import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/base/controllers/play_music_controller.dart';
import 'package:flutter_music/models/play_entity.dart';
import 'package:flutter_music/res/color_style.dart';
import 'package:flutter_music/res/my_icon.dart';
import 'package:flutter_music/res/style.dart';
import 'package:flutter_music/routes/index.dart';
import 'package:flutter_music/widgets/border_image.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

Widget bottomPlayPage({required double bottom}) {
  final controller = Get.find<PlayMusicController>();
  return Obx(
    () => Visibility(
      visible: controller.songs.isNotEmpty,
      child: Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: Column(
          children: [
            const _BottomPlayPage(),
            Container(
              height: bottom,
              width: double.infinity,
              color: ColorStyle.B9C5F7,
            )
          ],
        ),
      ),
    ),
  );
}

class _BottomPlayPage extends StatefulWidget {
  const _BottomPlayPage();

  @override
  State<_BottomPlayPage> createState() => _BottomPlayPageState();
}

class _BottomPlayPageState extends State<_BottomPlayPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final controller = Get.find<PlayMusicController>();

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.repeat();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final song = controller.songs[controller.currentIndex.value];
      return _bg(
        onTap: () => Get.toNamed(Routes.play),
        children: [
          ///图片
          _cover(
            ///动画控制器
            _controller,

            ///歌曲实体
            song,
          ),

          ///歌曲信息
          _songInfo(song),

          ///播放按钮
          _playBtn(),

          ///歌曲列表
          _songList(),
        ],
      );
    });
  }
}

_playBtn() {
  return GetBuilder<PlayMusicController>(
      builder: (controller) {
        var percent =
            controller.played.inMilliseconds / controller.all.inMilliseconds;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GestureDetector(
            onTap: controller.playOrPause,
            child: CircularPercentIndicator(
              radius: 18,
              lineWidth: 1,
              percent: percent > 1 ? 1 : percent,
              progressColor: Colors.white,
              center: GetBuilder<PlayMusicController>(
                builder: (_) {
                  return Icon(
                    controller.playerState == PlayerState.playing
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.white,
                    size: 26,
                  );
                },
              ),
            ),
          ),
        );
      },
      id: 'time');
}

_songInfo(PlayEntity song) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            song.name,
            style: Style.white14,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            song.singer,
            style: Style.white5412,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}

_cover(
  AnimationController animation,
  PlayEntity song,
) {
  return GetBuilder<PlayMusicController>(
    builder: (controller) {
      controller.playerState == PlayerState.playing
          ? animation.forward()
          : animation.stop();
      return RotationTransition(
        turns: animation,
        child: BorderImage(
          url: '${song.cover}?param=50y50',
          border: 25,
        ),
      );
    },
    id: 'animation',
  );
}

_songList() {
  return GestureDetector(
    onTap: () => Get.toNamed(Routes.play),
    child: const Icon(
      MyIcons.list,
      color: Colors.white,
      size: 30,
    ),
  );
}

Widget _bg({
  required VoidCallback onTap,
  required List<Widget> children,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      color: ColorStyle.B9C5F7,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    ),
  );
}
