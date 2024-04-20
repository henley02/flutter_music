import 'package:flutter/material.dart';
import 'package:flutter_music/res/color_style.dart';
import 'package:flutter_music/widgets/blur_image.dart';

Widget playBg({
  required String url,
  required List<Widget> children,
}) {
  return BlurImage(
    blur: 120,
    url: url,
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
      ),
    ),
  );
}

Widget headerLayout({
  required List<Widget> children,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 10,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    ),
  );
}

Widget songInfoLayout({required List<Widget> children}) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: children,
    ),
  );
}

Widget topIcon({
  required IconData icon,
  VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Icon(
      icon,
      color: ColorStyle.F3F3F3,
      size: 30,
    ),
  );
}

Widget songText({
  required String name,
  double fontSize = 16.0,
}) {
  return Text(
    name,
    style: TextStyle(
      color: Colors.white,
      fontSize: fontSize,
    ),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}

Widget centerLayout({
  required List<Widget> children,
}) {
  return Stack(
    children: children,
  );
}
