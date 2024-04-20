import 'package:flutter/material.dart';
import 'package:flutter_music/base/controllers/play_music_controller.dart';
import 'package:flutter_music/models/play_entity.dart';
import 'package:flutter_music/res/style.dart';
import 'package:flutter_music/theme/widgets/theme_text.dart';
import 'package:get/get.dart';

class SongDialogItem extends StatelessWidget {
  const SongDialogItem({
    Key? key,
    required this.entity,
    required this.index,
    required this.controller,
  }) : super(key: key);
  final PlayEntity entity;
  final int index;
  final PlayMusicController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ///歌曲和歌手民
        _songInfo(),

        ///删除图标
        _deleteIcon(),
      ],
    );
  }

  _songInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ThemeText(entity.name, style: Style.f3f3f316),
        Obx(
          () => Text(
            '-${entity.singer}',
            style: TextStyle(
                color: index == controller.currentIndex.value
                    ? Colors.red
                    : Colors.white54,
                fontSize: 12),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  _deleteIcon() {
    return IconButton(
      onPressed: () => controller.delete(index),
      icon: const Icon(
        Icons.delete,
        color: Colors.white54,
        size: 20,
      ),
    );
  }
}
