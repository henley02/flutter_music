import 'package:flutter/material.dart';
import 'package:flutter_music/theme/theme_controller.dart';
import 'package:get/get.dart';

class ThemeBackButton extends GetView<ThemeController> {
  const ThemeBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BackButton(color: controller.fontColor.value),
    );
  }
}
