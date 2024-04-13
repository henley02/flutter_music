import 'package:flutter/material.dart';
import 'package:flutter_music/models/play_list_detail_entity.dart';
import 'package:flutter_music/pages/discover_module/play_list_module/play_list_detail/controller.dart';
import 'package:flutter_music/res/color_style.dart';
import 'package:flutter_music/utils/string_util.dart';
import 'package:get/get.dart';

class BorderButton extends StatelessWidget {
  final PlayListDetailEntity entity;
  final PlayListDetailController controller;
  final VoidCallback? onFavorite;
  final VoidCallback? onShare;
  final VoidCallback? onComment;

  const BorderButton({
    super.key,
    required this.entity,
    required this.controller,
    this.onFavorite,
    this.onShare,
    this.onComment,
  });

  @override
  Widget build(BuildContext context) {
    final items = <Map<String, dynamic>>[
      {
        'icon': Icons.favorite_border,
        'count': entity.subscribedCount,
        'onTap': onFavorite,
      },
      {
        'icon': Icons.comment,
        'count': entity.commentCount,
        'onTap': onComment,
      },
      {
        'icon': Icons.share,
        'count': entity.shareCount,
        'onTap': onShare,
      },
    ];
    List<Widget> children = List.generate(items.length, (index) {
      return _item(
        icon: items[index]['icon'],
        count: items[index]['count'],
        onTap: items[index]['onTap'],
      );
    });

    List<Widget> result = [];
    for (int i = 0; i < children.length; i++) {
      result.add(children[i]);
      if (i != children.length - 1) {
        result.add(
          ///竖分割线
          Container(
            width: 1,
            color: ColorStyle.B8C0D4,
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
        );
      }
    }
    return Obx(() {
      var start = controller.isOfficial ? 335 : 255;
      var position = start - controller.offset.value;

      return Visibility(
        visible: position > 80,
        child: Positioned(
          top: position,
          child: Container(
            width: MediaQuery.of(context).size.width - 60,
            margin: const EdgeInsets.only(left: 30, right: 30),
            padding: const EdgeInsets.symmetric(horizontal: 30),
            height: 40,
            decoration: BoxDecoration(
              color: ColorStyle.X87A4ED,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: result,
            ),
          ),
        ),
      );
    });
  }

  _item({
    required IconData icon,
    required int count,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            StringUtil.formatCount(count),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
