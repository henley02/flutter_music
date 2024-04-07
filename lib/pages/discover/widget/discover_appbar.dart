import 'package:flutter/material.dart';
import 'package:flutter_music/res/color_style.dart';
import 'package:flutter_music/widgets/search_input.dart';

class DiscoverAppbar extends StatelessWidget {
  const DiscoverAppbar({
    super.key,
    this.onSearchTap,
    this.onMenuTap,
    this.onVoiceTap,
  });
  final VoidCallback? onSearchTap;
  final VoidCallback? onMenuTap;
  final VoidCallback? onVoiceTap;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Icon(
        Icons.menu,
        color: ColorStyle.F3F3F3,
      ),
      title: _search(),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: onVoiceTap,
          icon: const Icon(
            Icons.keyboard_voice,
            color: ColorStyle.F3F3F3,
          ),
        ),
      ],
    );
  }

  _search() {
    return SearchInput(
      onTap: onSearchTap,
    );
  }
}
