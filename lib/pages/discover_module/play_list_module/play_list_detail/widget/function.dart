import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/pages/bottom_play/bottom_music_page.dart';
import 'package:flutter_music/res/style.dart';
import 'package:flutter_music/theme/widgets/theme_adapter.dart';
import 'package:flutter_music/theme/widgets/theme_text.dart';
import 'package:flutter_music/widgets/box.dart';

Widget playListDetailPage({
  required List<Widget> slivers,
  required ScrollController scrollController,
  required Widget borderButton,
}) {
  return BottomMusicPage(
    child: Stack(
      children: [
        CustomScrollView(
          controller: scrollController,
          slivers: slivers,
        ),
        borderButton,
      ],
    ),
  );
}

Widget detailToHeader({required List<Widget> children}) {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(15, 56, 15, 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    ),
  );
}

Widget detailTopHeaderRight({
  required List<Widget> children,
}) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    ),
  );
}

Widget detailTitle({required String title}) {
  return ThemeText(
    title,
    style: Style.white18,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
  );
}

Widget appbarTitle({
  required String title,
}) {
  return ThemeText(
    title,
    style: Style.white18,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}

Widget detailAuthor({
  required String avatar,
  required String name,
  required VoidCallback onTap,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      CircleAvatar(
        radius: 12.0,
        backgroundImage: CachedNetworkImageProvider(avatar),
      ),
      hBox(5),
      Expanded(
        child: ThemeAdapter(
          builder: (controller) {
            return Text(
              name,
              style: TextStyle(
                color: controller.fontColor.value.withOpacity(0.5),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            );
          },
        ),
      ),
      IconButton(
        onPressed: onTap,
        icon: Icon(
          Icons.arrow_forward_ios,
          color: Colors.white.withOpacity(0.5),
          size: 20,
        ),
      ),
    ],
  );
}

Widget detailDesc({
  required String desc,
}) {
  return ThemeAdapter(
    builder: (controller) {
      return Text(
        desc,
        style: TextStyle(
          color: controller.fontColor.value.withOpacity(0.5),
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      );
    },
  );
}
