import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

///模糊图片
class BlurImage extends StatelessWidget {
  const BlurImage({
    Key? key,
    required this.url,
    required this.blur,
    this.child,
  }) : super(key: key);

  final String url;
  final double blur;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        url.startsWith('http')
            ? CachedNetworkImage(
                imageUrl: url,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              )
            : Image.asset(
                url,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            color: Colors.black.withOpacity(0),
            child: ClipRect(
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
