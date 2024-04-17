import 'package:flutter/material.dart';
import 'package:flutter_music/models/play_list_detail_entity.dart';
import 'package:flutter_music/theme/widgets/theme_text.dart';
import 'package:flutter_music/utils/image_util.dart';
import 'package:flutter_music/widgets/blur_image.dart';
import 'package:flutter_music/widgets/border_image.dart';
import 'package:flutter_music/widgets/box.dart';
import 'package:get/get.dart';

class PlayListDescPage extends StatelessWidget {
  PlayListDescPage({Key? key}) : super(key: key);

  final PlayListDetailEntity entity = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: BlurImage(
        blur: 100,
        url: entity.coverImgUrl,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
          child: _descBg(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: BackButton(
                  color: Colors.white,
                ),
              ),
              vBox(50),

              ///圆角图
              _cover(context),
              vBox(25),

              ///歌单名
              _name(),

              vBox(25),
              const Divider(
                color: Colors.white24,
                height: 1,
                indent: 20,
                endIndent: 20,
              ),
              vBox(8),

              ///歌单标签
              _tags(),

              vBox(8),

              ///歌单描述
              _desc(),

              ///保存封面
              _saveCover(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _descBg({required List<Widget> children}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }

  _cover(context) {
    return BorderImage(
      url: entity.coverImgUrl,
      border: 15,
      width: MediaQuery.of(context).size.width * 0.6,
    );
  }

  _name() {
    return ThemeText(
      entity.name,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  _tags() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const ThemeText(
          '标签:',
          style: TextStyle(fontSize: 12),
        ),
        hBox(10),
        Wrap(
          spacing: 10,
          children: entity.tags
              .map(
                (e) => Chip(
                  label: ThemeText(
                    e,
                    style: const TextStyle(fontSize: 12),
                  ),
                  backgroundColor: Colors.black.withOpacity(0.2),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  _desc() {
    return Expanded(
      child: ThemeText(
        entity.description,
        style: const TextStyle(
          fontSize: 12,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 10,
      ),
    );
  }

  _saveCover() {
    return GestureDetector(
      onTap: () => ImageUtils.saveImage(entity.coverImgUrl),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: Colors.white38,
              width: 0.7,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const ThemeText(
            '保存封面',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
