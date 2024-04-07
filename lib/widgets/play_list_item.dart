import 'package:flutter/material.dart';
import 'package:flutter_music/res/style.dart';
import 'package:flutter_music/theme/widgets/theme_text.dart';
import 'package:flutter_music/widgets/border_image.dart';

class PlayListItem extends StatelessWidget {
  const PlayListItem({
    Key? key,
    required this.title,
    required this.cover,
    this.playCount,
  }) : super(key: key);

  final String title;
  final String cover;
  final int? playCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///图片
          _cover(),

          ///标题
          _title(),
        ],
      ),
    );
  }

  _cover() {
    return BorderImage(
      url: cover,
      border: 10,
      playCount: playCount,
      width: 140,
      boxFit: BoxFit.fitWidth,
    );
  }

  _title() {
    return Expanded(
      child: ThemeText(
        title,
        maxLines: 2,
        style: Style.f3f3f316,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
