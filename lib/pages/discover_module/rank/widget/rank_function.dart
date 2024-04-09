import 'package:flutter/material.dart';
import 'package:flutter_music/pages/bottom_play/bottom_music_page.dart';
import 'package:flutter_music/res/style.dart';
import 'package:flutter_music/theme/widgets/theme_backbutton.dart';
import 'package:flutter_music/theme/widgets/theme_text.dart';

Widget rankBg({
  required List<Widget> slivers,
}) {
  return BottomMusicPage(
    child: SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: CustomScrollView(
            slivers: slivers,
          ),
        ),
      ),
    ),
  );
}

SliverAppBar rankAppBar() {
  return const SliverAppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: ThemeBackButton(),
    title: ThemeText(
      '排行榜',
      style: TextStyle(
        fontSize: 20,
      ),
    ),
    centerTitle: true,
  );
}

SliverToBoxAdapter officialTitle({
  required List<Widget> children,
}) {
  return SliverToBoxAdapter(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    ),
  );
}

SliverToBoxAdapter otherTitle() {
  return const SliverToBoxAdapter(
    child: ThemeText(
      '其他榜单',
      style: Style.white20,
    ),
  );
}
