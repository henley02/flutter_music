import 'package:flutter/material.dart';
import 'package:flutter_music/theme/widgets/theme_text.dart';
import 'package:flutter_music/widgets/box.dart';

class CustomListTitle extends StatelessWidget {
  const CustomListTitle({
    Key? key,
    this.width,
    this.height,
    this.leading,
    this.title,
    this.subTitle,
    this.trailing,
    this.padding,
    this.onTap,
    this.onTrailTap,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Widget? leading;
  final String? title;
  final String? subTitle;
  final Widget? trailing;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final VoidCallback? onTrailTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        width: width,
        height: height,
        padding: padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (leading != null) leading!,
            if (leading != null) hBox(8)!,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null)
                    ThemeText(
                      title!,
                      style: const TextStyle(fontSize: 16),
                    ),
                  if (title != null) vBox(4),
                  if (subTitle != null && subTitle!.isNotEmpty)
                    Text(
                      subTitle!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white54,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
            if (trailing != null) hBox(10),
            if (trailing != null)
              GestureDetector(
                onTap: onTrailTap,
                child: trailing,
              ),
          ],
        ),
      ),
    );
  }
}
