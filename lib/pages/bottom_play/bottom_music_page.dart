import 'package:flutter/material.dart';
import 'package:flutter_music/pages/bottom_play/page.dart';
import 'package:flutter_music/theme/widgets/theme_background.dart';

///底部有悬浮播放器页面统一布局
class BottomMusicPage extends StatelessWidget {
  const BottomMusicPage({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ThemeBackground(
      child: Stack(
        children: [
          child,
          bottomPlayPage(bottom: 0),
        ],
      ),
    );
  }
}
