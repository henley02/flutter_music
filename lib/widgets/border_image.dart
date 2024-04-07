import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/style.dart';
import 'package:flutter_music/utils/string_util.dart';

class BorderImage extends StatelessWidget {
  const BorderImage({
    Key? key,
    required this.url,
    required this.border,
    this.boxFit,
    this.playCount,
    this.width,
    this.alignment = Alignment.center,
  }) : super(key: key);

  final String url;
  final double border;
  final BoxFit? boxFit;
  final int? playCount;
  final double? width;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _backImg(),
        playCount == null ? Container() : float(),
      ],
    );
  }

  _backImg() {
    return Align(
      alignment: alignment!,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(border),
        child: url.startsWith('http')
            ? CachedNetworkImage(
                imageUrl: url,
                fit: boxFit,
                width: width,
              )
            : Image.asset(
                url,
                fit: boxFit,
                width: width,
              ),
      ),
    );
  }

  float() {
    return Positioned(
      top: 2,
      right: 5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Container(
          color: Colors.black.withOpacity(0.5),
          child: Row(
            children: [
              const Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 14,
              ),
              Text(
                StringUtil.formatCount(playCount!),
                style: Style.white12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
