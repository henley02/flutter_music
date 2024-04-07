import 'package:flutter/material.dart';
import 'package:flutter_music/widgets/border_image.dart';
import 'package:flutter_music/widgets/custom_list_title.dart';

class ImageSongItem extends StatelessWidget {
  const ImageSongItem({
    Key? key,
    required this.cover,
    required this.name,
    required this.artist,
    this.trailing = false,
    this.onTrailTap,
  }) : super(key: key);

  final String cover;
  final String name;
  final String artist;
  final bool trailing;
  final VoidCallback? onTrailTap;

  @override
  Widget build(BuildContext context) {
    return CustomListTitle(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      leading: _cover(),
      title: name,
      subTitle: artist,
      trailing: Visibility(
        visible: trailing,
        child: GestureDetector(
          onTap: onTrailTap,
          child: const Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  _cover() {
    return BorderImage(
      url: cover,
      border: 10,
      width: 50,
      boxFit: BoxFit.cover,
    );
  }
}
