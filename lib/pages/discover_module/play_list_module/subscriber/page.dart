import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/base/views/get_common_view.dart';
import 'package:flutter_music/models/creator_entity.dart';
import 'package:flutter_music/pages/bottom_play/bottom_music_page.dart';
import 'package:flutter_music/pages/discover_module/play_list_module/subscriber/controller.dart';
import 'package:flutter_music/refresh/refresh_widget.dart';
import 'package:flutter_music/res/color_style.dart';
import 'package:flutter_music/theme/widgets/theme_text.dart';
import 'package:flutter_music/widgets/custom_list/build_list.dart';
import 'package:flutter_music/widgets/custom_list_title.dart';

class SubscriberPage extends GetCommonView<SubscriberController> {
  const SubscriberPage({super.key});

  @override
  Widget buildWidget(BuildContext context) {
    return BottomMusicPage(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          title: const ThemeText(
            '收藏者',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          leading: const BackButton(color: Colors.white),
          backgroundColor: ColorStyle.X6D8EE9.withOpacity(0.8),
        ),
        body: RefreshWidget<SubscriberController>(
          enablePullDown: false,
          child: buildList<CreatorEntity>(
            itemBuilder: (item, index) {
              return CustomListTitle(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: CachedNetworkImageProvider(item.avatarUrl),
                ),
                title: item.nickname,
                subTitle: item.signature,
                padding: const EdgeInsets.symmetric(horizontal: 16),
              );
            },
            items: controller.data,
          ),
        ),
      ),
    );
  }
}
