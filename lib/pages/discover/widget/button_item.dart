import 'package:flutter/material.dart';
import 'package:flutter_music/theme/widgets/theme_container.dart';
import 'package:flutter_music/theme/widgets/theme_text.dart';

class ButtonItem extends StatelessWidget {
  const ButtonItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    var onTap = item['onTap'];
    var src = item['src'];
    var title = item['title'];
    String? day = item['day'];

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        child: Column(
          children: [
            _buildImg(src, day),
            _buildTitle(title),
          ],
        ),
      ),
    );
  }

  _buildTitle(title) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ThemeText(
        title,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }

  _buildImg(src, day) {
    return Stack(
      children: [
        ThemeContainer(
          width: 60,
          height: 60,
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(src),
        ),
        day == null
            ? const SizedBox()
            : Positioned(
                left: 23,
                top: 25,
                child: ThemeText(
                  day,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
      ],
    );
  }
}
