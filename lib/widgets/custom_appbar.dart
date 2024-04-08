import 'package:flutter/material.dart';
import 'package:flutter_music/theme/widgets/theme_adapter.dart';
import 'package:flutter_music/widgets/box.dart';
import 'package:flutter_music/widgets/custom_space_bar.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    required this.content,
    required this.background,
    this.height,
    this.backgroundColor,
    this.centerTitle,
  }) : super(key: key);

  final Widget? title;
  final Widget content;
  final Widget background;
  final double? height;
  final Color? backgroundColor;
  final bool? centerTitle;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: ThemeAdapter(
        builder: (controller) {
          return BackButton(
            color: controller.fontColor.value,
          );
        },
      ),
      expandedHeight: height ?? 200,
      backgroundColor: backgroundColor,
      elevation: 0,
      centerTitle: centerTitle ?? false,
      title: title,
      pinned: true,
      stretch: true,
      flexibleSpace: backgroundColor != null
          ? FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
              background: Stack(
                children: [background, content],
              ),
            )
          : FlexibleDetailBar(
              content: content,
              background: background,
            ),
      actions: [
        ThemeAdapter(
          builder: (controller) {
            return Icon(
              Icons.search,
              color: controller.fontColor.value,
            );
          },
        ),
        hBox(15),
        ThemeAdapter(
          builder: (controller) {
            return Icon(
              Icons.more_vert,
              color: controller.fontColor.value,
            );
          },
        ),
      ],
    );
  }
}
