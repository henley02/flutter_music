import 'package:flutter/material.dart';

///渐变色按钮
class GradientButton extends StatelessWidget {
  /// 渐变色数组
  final List<Color>? colors;

  /// 点击回调
  final VoidCallback? onTap;

  final double? width;
  final double? height;

  /// 圆角
  final double borderRadius;
  final Widget child;

  const GradientButton({
    Key? key,
    this.colors,
    this.onTap,
    this.width,
    this.height,
    required this.borderRadius,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    List<Color> _colors =
        colors ?? [theme.primaryColor, theme.primaryColorDark];
    print(_colors);
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _colors),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius),
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(
              width: width,
              height: height,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
