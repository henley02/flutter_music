import 'package:flutter/material.dart';
import 'package:flutter_music/theme/theme_controller.dart';
import 'package:get/get.dart';

class ThemeContainer extends GetView<ThemeController> {
  final double? width;
  final double? height;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;
  final BorderRadiusGeometry? borderRadius;
  final Border? border;
  final List<BoxShadow>? boxShadow;

  const ThemeContainer({
    super.key,
    this.width,
    this.height,
    this.child,
    this.padding,
    this.margin,
    this.borderRadius,
    this.border,
    this.boxShadow,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        alignment: alignment,
        decoration: BoxDecoration(
          color: controller.widgetBgColor.value.withOpacity(
            controller.widgetOpacity.value,
          ),
          borderRadius: borderRadius,
          border: border,
          boxShadow: boxShadow,
        ),
        child: child,
      ),
    );
  }
}
