import 'package:flutter/material.dart';
import 'package:flutter_music/base/controllers/play_music_controller.dart';
import 'package:flutter_music/pages/play/controller.dart';
import 'package:flutter_music/pages/play/widget/play_audio_controller.dart';
import 'package:flutter_music/pages/play/widget/play_function.dart';
import 'package:flutter_music/pages/play/widget/play_function_button.dart';
import 'package:flutter_music/pages/play/widget/play_slider.dart';
import 'package:flutter_music/pages/play/widget/record.dart';
import 'package:flutter_music/pages/play/widget/stylus.dart';
import 'package:flutter_music/widgets/songs_dialog/songs_dialog.dart';
import 'package:get/get.dart';

class PlayPage extends GetView<PlayController> {
  const PlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    final musicController = Get.find<PlayMusicController>();
    return Obx(
      () {
        final song = musicController.songs[musicController.currentIndex.value];
        controller.getCommentCount(song.id);

        ///背景布局
        return playBg(
          ///背景图片
          url: song.cover,
          children: [
            ///头部歌曲信息及按钮布局
            headerLayout(
              children: [
                ///箭头
                topIcon(
                  icon: Icons.expand_more,
                  onTap: () => Get.back(),
                ),

                ///歌曲信息布局
                songInfoLayout(
                  children: [
                    ///歌曲名
                    songText(name: song.name),

                    ///歌手名
                    songText(name: song.singer, fontSize: 12.0),
                  ],
                ),

                ///分享按钮
                topIcon(icon: Icons.share),
              ],
            ),

            ///中间唱片部分
            GetBuilder<PlayMusicController>(
              builder: (_) {
                controller.onStateChanged(musicController.playerState);
                return centerLayout(
                  children: [
                    ///唱片
                    Record(
                      animation: controller.roundController,
                      url: song.cover,
                    ),

                    ///唱针
                    Stylus(
                      stylusAnimation: controller.stylusAnimation,
                    ),
                  ],
                );
              },
              id: 'animation',
            ),
            Expanded(
              child: Container(),
            ),

            ///功能按钮区布局
            PlayFunctionButtons(
              onSubscribed: () => controller
                ..isLiked = !controller.isLiked
                ..update(['like']),
            ),

            ///进度条
            PlaySlider(
              onChanged: (value) => musicController.seeking(value),
              onDragEnd: (value) => musicController.seekTo(value),
              onDragStart: () => musicController.startSeek(),
            ),

            ///控制区按钮
            PlayAudioController(
              ///上一首
              onPrevious: () => musicController.previous(),

              ///播放
              onPlay: () => musicController.playOrPause(),

              ///下一首
              onNext: () => musicController.next(),

              ///歌曲列表
              onList: () => Get.bottomSheet(
                const SongsDialog(),
              ),
            ),
          ],
        );
      },
    );
  }
}
