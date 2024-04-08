import 'package:flutter/material.dart';
import 'package:flutter_music/base/views/get_state_view.dart';
import 'package:flutter_music/models/play_list_detail_song_entity.dart';
import 'package:flutter_music/pages/discover_module/daily_song/controller.dart';
import 'package:flutter_music/pages/discover_module/daily_song/widget/daily_content.dart';
import 'package:flutter_music/pages/discover_module/daily_song/widget/daily_function.dart';
import 'package:flutter_music/res/r.dart';
import 'package:flutter_music/theme/widgets/theme_text.dart';
import 'package:flutter_music/utils/date_util.dart';
import 'package:flutter_music/widgets/blur_image.dart';
import 'package:flutter_music/widgets/custom_appbar.dart';
import 'package:flutter_music/widgets/custom_list/build_list.dart';
import 'package:flutter_music/widgets/custom_strick.dart';
import 'package:flutter_music/widgets/song_item/image_song_item.dart';
import 'package:sliver_tools/sliver_tools.dart';

class DailySongsPage
    extends GetStateView<DailySongsController, List<PlayListDetailSongEntity>> {
  const DailySongsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, data) {
    return dailyBg(children: [
      CustomAppBar(
        ///头部标题
        title: const ThemeText(
          '每日推荐',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        centerTitle: true,

        ///头部内容
        content: headerContentLayout(
          children: [
            ///自适应
            const Spacer(),

            ///日期显示
            DailyContent(
              ///天数
              dd: '${DateUtil.formatDate(DateTime.now(), format: 'dd')} ',

              ///月数
              mm: '/ ${DateUtil.formatDate(DateTime.now(), format: 'MM')}',
            ),

            ///文字
            headerContentTitle(),
          ],
        ),

        ///头部背景模糊图片
        background: BlurImage(
          url: R.images.dailyBg,
          blur: 100,
        ),
      ),
      CustomStrick(
        length: data.length,
      ),

      ///列表
      SliverClip(
        child: buildSliverList<PlayListDetailSongEntity>(
          itemBuilder: (item, index) {
            return ImageSongItem(
              name: item.name,
              cover: item.picUrl,
              artist: item.singer + item.description,
              trailing: true,
            );
          },
          items: data,
        ),
      ),
    ]);
  }
}
