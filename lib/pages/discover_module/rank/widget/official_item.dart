import 'package:flutter/material.dart';
import 'package:flutter_music/models/rank_entity.dart';
import 'package:flutter_music/res/style.dart';
import 'package:flutter_music/theme/widgets/theme_container.dart';
import 'package:flutter_music/theme/widgets/theme_text.dart';
import 'package:flutter_music/widgets/border_image.dart';
import 'package:flutter_music/widgets/box.dart';

class OfficialItem extends StatelessWidget {
  const OfficialItem({
    Key? key,
    required this.entity,
  }) : super(key: key);
  final RankEntity entity;

  @override
  Widget build(BuildContext context) {
    return _itemBg(
      children: [
        ///标题和更新时间
        _titleAndTime(
          children: [
            ///标题
            ThemeText(entity.name, style: Style.white20),

            ///更新时间
            ThemeText(entity.updateFrequency, style: Style.white12),
          ],
        ),
        vBox(10),

        ///图片和歌曲信息布局
        _imageAndSong(
          children: <Widget>[
            ///图片
            BorderImage(
              url: entity.coverImgUrl,
              border: 12.0,
              width: 70,
            ),

            hBox(10),

            ///歌曲信息布局
            _songInfo(
              ///数据源
              tracks: entity.tracks,

              ///单项构造器
              itemBuilder: (name) {
                return ThemeText(
                  name,
                  style: const TextStyle(fontSize: 15),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

_songInfo({
  required List<Track> tracks,
  required Widget Function(String name) itemBuilder,
}) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        tracks.length,
        (index) => itemBuilder(
          '${index + 1}.${tracks[index].name}-${tracks[index].singer}',
        ),
      ),
    ),
  );
}

_imageAndSong({required List<Widget> children}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: children,
  );
}

_titleAndTime({required List<Widget> children}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: children,
  );
}

Widget _itemBg({required List<Widget> children}) {
  return ThemeContainer(
    margin: const EdgeInsets.only(top: 10),
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    borderRadius: BorderRadius.circular(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    ),
  );
}
