import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/theme/theme_controller.dart';
import 'package:get/get.dart';

class ThemeBackground extends GetView<ThemeController> {
  final Widget child;

  const ThemeBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(
          () {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: controller.isImage.value
                    ? Colors.transparent
                    : controller.bgColor.value,
                image: controller.isImage.value
                    ? DecorationImage(
                        image: controller.cover.value.startsWith('http')
                            ? CachedNetworkImageProvider(
                                controller.cover.value,
                              )
                            : AssetImage(controller.cover.value)
                                as ImageProvider,
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: controller.coverBlur.value,
                  sigmaY: controller.coverBlur.value,
                ),
                child: ClipRect(
                  child: Container(
                    color: controller.widgetBgColor.value.withOpacity(0.1),
                    child: child,
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
