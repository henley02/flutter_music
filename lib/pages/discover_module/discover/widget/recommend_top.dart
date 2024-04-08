import 'package:flutter/material.dart';
import 'package:flutter_music/res/style.dart';
import 'package:flutter_music/theme/widgets/theme_adapter.dart';
import 'package:flutter_music/theme/widgets/theme_text.dart';

class RecommendTop extends StatelessWidget {
  const RecommendTop({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildTitle(),
            _buildButton(),
          ],
        ),
      ),
    );
  }

  _buildTitle() {
    return ThemeText(
      title,
      style: Style.white18,
    );
  }

  _buildButton() {
    return GestureDetector(
      onTap: onTap,
      child: ThemeAdapter(
        builder: (controller) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: controller.fontColor.value,
                width: 0.3,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '更多',
                  style: TextStyle(
                      fontSize: 14, color: controller.fontColor.value),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: controller.fontColor.value,
                  size: 14,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
