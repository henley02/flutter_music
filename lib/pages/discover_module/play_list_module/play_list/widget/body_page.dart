import 'package:flutter/material.dart';
import 'package:flutter_music/models/play_list_entity.dart';
import 'package:flutter_music/pages/discover_module/play_list_module/play_list/controllers/body_controller.dart';
import 'package:flutter_music/refresh/refresh_widget.dart';
import 'package:flutter_music/routes/index.dart';
import 'package:flutter_music/widgets/custom_list/build_grid.dart';
import 'package:flutter_music/widgets/play_list_item.dart';
import 'package:get/get.dart';

class PlayListBodyPage extends StatelessWidget {
  final String cat;
  const PlayListBodyPage({
    Key? key,
    required this.cat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayListBodyController>(
      builder: (controller) {
        return RefreshWidget<PlayListBodyController>(
          enablePullDown: false,
          tag: cat,
          child: buildGrid<PlayListEntity>(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            items: controller.data,
            itemBuilder: (item, index) {
              return PlayListItem(
                title: item.name,
                cover: item.coverImgUrl,
              );
            },
            onTap: (item, index) =>
                Get.toNamed(Routes.playListDetail, arguments: item.id),
          ),
        );
      },
      tag: cat,
    );
  }
}
