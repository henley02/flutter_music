import 'package:flutter/material.dart';
import 'package:flutter_music/models/play_list_detail_entity.dart';
import 'package:flutter_music/res/r.dart';
import 'package:flutter_music/utils/date_util.dart';
import 'package:flutter_music/widgets/box.dart';

class OfficialBody extends StatelessWidget {
  const OfficialBody({
    Key? key,
    required this.entity,
  }) : super(key: key);
  final PlayListDetailEntity entity;

  @override
  Widget build(BuildContext context) {
    var start = entity.name.indexOf('[');
    var end = entity.name.indexOf(']');
    var title = start == -1 || end == -1
        ? entity.name
        : entity.name.substring(start + 1, end);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: R.fonts.PuHuiTi,
            ),
          ),
          vBox(12),
          Text(
            '更新时间：${DateUtil.formatDate(DateTime.fromMillisecondsSinceEpoch(entity.updateTime), format: 'yyyy-MM-dd')}',
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white54,
            ),
          ),
          vBox(12),
          Text(
            entity.description,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white54,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
