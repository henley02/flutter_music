import 'package:flutter/material.dart';
import 'package:flutter_music/pages/index/controller.dart';
import 'package:flutter_music/res/r.dart';
import 'package:flutter_music/theme/widgets/theme_background.dart';

Widget indexBg({required List<Widget> children}) {
  return ThemeBackground(
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: children,
      ),
    ),
  );
}

Widget indexPageView({required IndexController controller}) {
  return PageView.builder(
    itemBuilder: (context, index) {
      return controller.pageList[index];
    },
    controller: controller.pageController,
    itemCount: controller.pageList.length,
    physics: const NeverScrollableScrollPhysics(),
  );
}

Widget bottomLayout({
  required List<Map<String, String>> items,
  required Widget Function(Map<String, String> item, int index) itemBuilder,
}) {
  return Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    child: Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(R.images.btmBg),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          items.length,
          (index) => itemBuilder(items[index], index),
        ),
      ),
    ),
  );
}
