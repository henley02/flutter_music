import 'package:flutter/material.dart';
import 'package:flutter_music/models/recommend_play_list_entity.dart';
import 'package:flutter_music/pages/discover/controller.dart';
import 'package:flutter_music/pages/discover/widget/banner.dart';
import 'package:flutter_music/pages/discover/widget/button_item.dart';
import 'package:flutter_music/pages/discover/widget/discover_appbar.dart';
import 'package:flutter_music/pages/discover/widget/discover_function.dart';
import 'package:flutter_music/pages/discover/widget/recommend_top.dart';
import 'package:flutter_music/routes/index.dart';
import 'package:flutter_music/widgets/box.dart';
import 'package:flutter_music/widgets/custom_list/build_list.dart';
import 'package:flutter_music/widgets/page_loading.dart';
import 'package:flutter_music/widgets/play_list_item.dart';
import 'package:flutter_music/widgets/song_item/image_song_item.dart';
import 'package:get/get.dart';

class DiscoverPage extends GetView<DiscoverController> {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DiscoverController>(
      builder: (_) {
        bool loading = controller.banners.isEmpty ||
            controller.recommendPlayList.isEmpty ||
            controller.newSongList.isEmpty;
        return loading
            ? const PageLoading()
            : discoverBg(
                slivers: [
                  ///appbar
                  const DiscoverAppbar(),
                  sliverVBox(20),

                  ///轮播图
                  DiscoverBanner(
                    controller: controller,
                  ),
                  sliverVBox(20),

                  ///按钮
                  buttonsLayout(
                    items: controller.buttons,
                    itemBuilder: (item) {
                      return ButtonItem(
                        item: item,
                      );
                    },
                  ),
                  sliverVBox(18),

                  ///推荐歌单顶部
                  RecommendTop(
                    title: '推荐歌单',
                    onTap: () => Get.toNamed(Routes.playList),
                  ),
                  sliverVBox(6),

                  ///推荐歌单列表
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 200,
                      child: buildList<RecommendPlayListEntity>(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        itemBuilder: (item, index) {
                          return PlayListItem(
                            title: item.name,
                            cover: item.picUrl,
                            playCount: item.playCount,
                          );
                        },
                        separatorBuilder: (item, index) => hBox(10),
                        items: controller.recommendPlayList,
                        onItemTap: (item, index) {
                          Get.toNamed(
                            Routes.playListDetail,
                            arguments: item.id,
                          );
                        },
                      ),
                    ),
                  ),

                  ///推荐歌区
                  const RecommendTop(
                    title: '推荐歌曲',
                  ),
                  sliverVBox(6),

                  ///推荐歌曲列表
                  buildSliverList(
                    itemBuilder: (item, index) {
                      return ImageSongItem(
                        cover: item.picUrl,
                        name: item.name,
                        artist: item.artistName,
                      );
                    },
                    items: controller.newSongList,
                  ),

                  ///留空
                  sliverVBox(150),
                ],
              );
      },
    );
  }
}
