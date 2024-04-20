import 'package:flutter/material.dart';
import 'package:flutter_music/base/controllers/play_music_controller.dart';
import 'package:flutter_music/models/play_entity.dart';
import 'package:flutter_music/res/my_icon.dart';
import 'package:flutter_music/res/style.dart';
import 'package:flutter_music/theme/widgets/theme_background.dart';
import 'package:flutter_music/theme/widgets/theme_text.dart';
import 'package:flutter_music/widgets/box.dart';
import 'package:flutter_music/widgets/custom_list/build_list.dart';
import 'package:flutter_music/widgets/songs_dialog/item.dart';
import 'package:get/get.dart';

class SongsDialog extends StatelessWidget {
  const SongsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PlayMusicController>();

    return Container(
      width: double.infinity,
      height: 400,
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: ThemeBackground(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///标题文字
                _title(controller.songs.length),
                vBox(20),

                ///图标
                _icon(),
                vBox(15),

                ///列表
                Expanded(
                  child: Obx(
                    () => buildList<PlayEntity>(
                      itemBuilder: (item, index) {
                        return SongDialogItem(
                          entity: item,
                          index: index,
                          controller: controller,
                        );
                      },
                      items: controller.songs,
                      onItemTap: (item, index) => controller.playOne(item),
                      separatorBuilder: (item, index) => hBox(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _title(length) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const ThemeText(
          '当前播放',
          style: Style.white18,
        ),
        Text(
          '($length)',
          style: Style.b8c0d414,
        ),
      ],
    );
  }

  _icon() {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          MyIcons.loop,
          color: Colors.white,
          size: 20,
        ),
        ThemeText(
          '列表循环',
          style: Style.white12,
        ),
      ],
    );
  }
}
