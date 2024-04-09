import 'package:flutter/cupertino.dart';
import 'package:flutter_music/base/views/get_state_view.dart';
import 'package:flutter_music/models/rank_entity.dart';
import 'package:flutter_music/pages/discover_module/rank/controller.dart';
import 'package:flutter_music/pages/discover_module/rank/widget/official_item.dart';
import 'package:flutter_music/pages/discover_module/rank/widget/rank_function.dart';
import 'package:flutter_music/res/r.dart';
import 'package:flutter_music/res/style.dart';
import 'package:flutter_music/routes/index.dart';
import 'package:flutter_music/theme/widgets/theme_text.dart';
import 'package:flutter_music/widgets/border_image.dart';
import 'package:flutter_music/widgets/box.dart';
import 'package:flutter_music/widgets/custom_list/build_grid.dart';
import 'package:flutter_music/widgets/custom_list/build_list.dart';
import 'package:get/get.dart';

class RankPage extends GetStateView<RankController, List<RankEntity>> {
  const RankPage({super.key});

  @override
  Widget build(BuildContext context, List<RankEntity> data) {
    ///官方榜
    List<RankEntity> office =
        data.where((element) => element.tracks.isNotEmpty).toList();

    ///其他榜单
    List<RankEntity> other =
        data.where((element) => element.tracks.isEmpty).toList();

    return rankBg(
      slivers: [
        rankAppBar(),

        ///官方榜标题
        officialTitle(
          children: [
            ///官方圆形图标
            BorderImage(
              url: R.images.wylogo,
              border: 10,
              width: 20,
            ),
            hBox(10),

            ///文字
            const ThemeText(
              '官方榜',
              style: Style.white20,
            ),
          ],
        ),
        buildSliverList<RankEntity>(
          itemBuilder: (item, index) {
            return OfficialItem(entity: item);
          },
          items: office,
          onItemTap: (item, index) => Get.toNamed(
            Routes.playListDetail,
            arguments: item.id,
          ),
        ),
        sliverVBox(20),

        ///其他榜标题
        otherTitle(),

        ///其他榜列表
        buildSliverGrid<RankEntity>(
          items: other,
          itemBuilder: (item, index) {
            return BorderImage(
              url: item.coverImgUrl,
              border: 15,
            );
          },
          onTap: (item, index) => Get.toNamed(
            Routes.playListDetail,
            arguments: item.id,
          ),
          childAspectRatio: 0.9,
        ),
      ],
    );
  }
}
