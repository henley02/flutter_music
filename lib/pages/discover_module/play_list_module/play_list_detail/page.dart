import 'package:flutter/material.dart';
import 'package:flutter_music/base/views/get_state_view.dart';
import 'package:flutter_music/models/play_list_detail_entity.dart';
import 'package:flutter_music/models/play_list_detail_song_entity.dart';
import 'package:flutter_music/models/play_list_entity.dart';
import 'package:flutter_music/pages/discover_module/play_list_module/play_list_detail/controller.dart';
import 'package:flutter_music/pages/discover_module/play_list_module/play_list_detail/widget/border_button.dart';
import 'package:flutter_music/pages/discover_module/play_list_module/play_list_detail/widget/function.dart';
import 'package:flutter_music/pages/discover_module/play_list_module/play_list_detail/widget/normal_body.dart';
import 'package:flutter_music/pages/discover_module/play_list_module/play_list_detail/widget/official_body.dart';
import 'package:flutter_music/pages/discover_module/play_list_module/play_list_detail/widget/official_title.dart';
import 'package:flutter_music/pages/discover_module/play_list_module/play_list_detail/widget/subs.dart';
import 'package:flutter_music/res/color_style.dart';
import 'package:flutter_music/routes/index.dart';
import 'package:flutter_music/widgets/blur_image.dart';
import 'package:flutter_music/widgets/box.dart';
import 'package:flutter_music/widgets/custom_appbar.dart';
import 'package:flutter_music/widgets/custom_list/build_list.dart';
import 'package:flutter_music/widgets/custom_strick.dart';
import 'package:flutter_music/widgets/play_list_item.dart';
import 'package:flutter_music/widgets/song_item/index_song_item.dart';
import 'package:get/get.dart';
import 'package:sliver_tools/sliver_tools.dart';

class PlayListDetailPage
    extends GetStateView<PlayListDetailController, Map<String, dynamic>> {
  const PlayListDetailPage({super.key});

  @override
  Widget build(BuildContext context, Map<String, dynamic> data) {
    var entity = data['entity'] as PlayListDetailEntity;
    var songs = data['songs'] as List<PlayListDetailSongEntity>;
    var related = data['related'] as List<PlayListEntity>;
    return playListDetailPage(
      scrollController: controller.scrollController,
      borderButton: BorderButton(
        entity: entity,
        controller: controller,
      ),
      slivers: [
        CustomAppBar(
          title: controller.isOfficial

              ///如果为官方动态歌单则显示官方标题布局
              ? OfficialTitle(
                  url: entity.creator.avatarUrl,
                  name: '官方动态歌单',
                )
              : Obx(
                  () => appbarTitle(
                    ///控制标题文字的变化
                    title: controller.offset.value > 160 ? entity.name : '歌单',
                  ),
                ),

          ///高度
          height: controller.isOfficial ? 330 : 250,
          centerTitle: !controller.isOfficial,

          ///传入background时，appbar的背景色将会是背景颜色
          ///不传则是透明背景
          backgroundColor: controller.isOfficial ? null : ColorStyle.X6787E6,

          ///内容
          content: controller.isOfficial

              ///如果为官方动态歌单则显示官方内容布局
              ? OfficialBody(entity: entity)

              ///如果不是官方动态歌单则显示普通内容布局
              : NormalBody(
                  entity: entity,

                  ///点击描述
                  onDescTap: () =>
                      Get.toNamed(Routes.playlistDesc, arguments: entity),
                ),

          ///背景
          background: controller.isOfficial

              ///如果为官方动态歌单则显示模糊背景
              ? BlurImage(
                  blur: 100,
                  url: entity.coverImgUrl,
                )
              : Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: ColorStyle.X5A74BA,
                ),
        ),
        sliverVBox(10),
        CustomStrick(
          length: entity.trackCount,
          onTap: controller.playAll,
        ),
        SliverClip(
          child: buildSliverList(
            itemBuilder: (item, index) {
              return IndexSongItem(
                name: item.name,
                singer: item.singer,
                desc: item.description,
                index: index,
              );
            },
            items: songs,
            onItemTap: (item, index) => controller.playOne(item),
          ),
        ),
        sliverVBox(20),
        SubsPeople(
          count: entity.subscribedCount,
          items: entity.subscribers,
          onTap: () => Get.toNamed(Routes.subs, arguments: entity.id),
        ),
        sliverVBox(20),

        ///猜你喜欢
        ///推荐歌单
        SliverToBoxAdapter(
          child: SizedBox(
            height: 200,
            child: buildList<PlayListEntity>(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemBuilder: (item, index) {
                return PlayListItem(
                  title: item.name,
                  cover: item.coverImgUrl,
                );
              },
              separatorBuilder: (item, index) => hBox(10),
              items: related,
              onItemTap: (item, index) {
                ///重置歌单id
                controller.id = item.id;

                ///重构页面
                controller.onInit();

                ///控制器位置归零
                controller.scrollController.jumpTo(0);
              },
            ),
          ),
        ),
        sliverVBox(80),
      ],
    );
  }
}
