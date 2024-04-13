import 'package:flutter/material.dart';
import 'package:flutter_music/models/play_list_detail_entity.dart';
import 'package:flutter_music/pages/discover_module/play_list_module/play_list_detail/widget/function.dart';
import 'package:flutter_music/widgets/border_image.dart';
import 'package:flutter_music/widgets/box.dart';

class NormalBody extends StatelessWidget {
  const NormalBody({
    Key? key,
    required this.entity,
    required this.onDescTap,
  }) : super(key: key);
  final PlayListDetailEntity entity;
  final VoidCallback onDescTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: detailToHeader(
        children: [
          ///左侧图片
          BorderImage(
            url: '${entity.coverImgUrl}?param=200y200',
            border: 10,
            playCount: entity.playCount,
          ),
          hBox(10),

          ///右侧
          detailTopHeaderRight(
            children: [
              ///标题
              detailTitle(title: entity.name),

              ///作者
              detailAuthor(
                avatar: '${entity.creator.avatarUrl}?param=50y50',
                name: entity.creator.nickname,
                onTap: onDescTap,
              ),

              ///描述
              detailDesc(
                desc: entity.description,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
