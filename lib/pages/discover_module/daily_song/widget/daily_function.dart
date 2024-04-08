import 'package:flutter/material.dart';
import 'package:flutter_music/pages/bottom_play/bottom_music_page.dart';

Widget dailyBg({
  required List<Widget> children,
}) {
  return BottomMusicPage(
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: children,
      ),
    ),
  );
}

Widget headerContentLayout({required List<Widget> children}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    ),
  );
}

Widget headerContentTitle() {
  return Container(
    margin: const EdgeInsets.only(bottom: 15),
    child: const Text(
      '根据你的音乐口味，为你推荐好音乐。',
      style: TextStyle(fontSize: 14, color: Colors.white70),
    ),
  );
}
