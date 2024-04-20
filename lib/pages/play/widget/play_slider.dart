import 'package:flutter/material.dart';
import 'package:flutter_music/base/controllers/play_music_controller.dart';
import 'package:flutter_music/res/style.dart';
import 'package:flutter_music/typedef/function.dart';
import 'package:flutter_music/utils/string_util.dart';
import 'package:get/get.dart';

class PlaySlider extends StatelessWidget {
  const PlaySlider({
    Key? key,
    this.onChanged,
    this.onDragStart,
    this.onDragEnd,
  }) : super(key: key);

  final ValueChanged<double>? onChanged;
  final VoidCallback? onDragStart;
  final ValueChanged<double>? onDragEnd;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayMusicController>(
      id: 'time',
      builder: (controller) {
        ///已播时长转毫秒
        var played = controller.played.inMilliseconds;

        ///总时长转毫秒
        var all = controller.all.inMilliseconds;

        ///已播时长时间格式化字符串
        var playedStr = StringUtil.subTime(played);

        ///总时长格式化字符串
        var allStr = StringUtil.subTime(all);

        return _bgLayout(
          children: <Widget>[
            ///左侧时间
            _timeText(playedStr),

            ///进度条
            _slider(
              ///进度防止溢出
              progress: played > all ? all.toDouble() : played.toDouble(),

              ///改变进度条进度
              onChanged: onChanged,

              ///拖动结束
              onDragEnd: onDragEnd,

              ///进度最大值
              max: all.toDouble(),
            ),

            ///右侧时间
            _timeText(allStr),
          ],
        );
      },
    );
  }
}

Widget _timeText(String time) {
  return Text(
    time,
    style: Style.white12,
  );
}

Widget _bgLayout({
  required List<Widget> children,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    ),
  );
}

Widget _slider({
  required double progress,
  ParamCallback<double>? onChanged,
  ParamCallback<double>? onDragEnd,
  ParamCallback<double>? onDragStart,
  required double max,
}) {
  return Expanded(
    child: SliderTheme(
      data: const SliderThemeData(
        trackHeight: 2,
        thumbShape: RoundSliderThumbShape(
          enabledThumbRadius: 10,
        ),
        thumbColor: Colors.white,
        activeTrackColor: Colors.white,
        inactiveTrackColor: Colors.white54,
      ),
      child: Slider(
        value: progress,
        onChanged: (value) => onChanged?.call(value),
        onChangeEnd: (value) => onDragEnd?.call(value),
        onChangeStart: (value) => onDragStart?.call(value),
        min: 0,
        max: max,
      ),
    ),
  );
}
