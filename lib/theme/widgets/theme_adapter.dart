import 'package:flutter/material.dart';
import 'package:flutter_music/theme/theme_controller.dart';
import 'package:get/get.dart';

class ThemeAdapter extends GetView<ThemeController> {
  const ThemeAdapter({
    Key? key,
    required this.builder,
  }) : super(key: key);

  final Widget Function(ThemeController) builder;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => builder(controller),
    );
  }
}
