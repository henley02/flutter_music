import 'package:flutter/material.dart';
import 'package:flutter_music/res/color_style.dart';
import 'package:flutter_music/res/style.dart';
import 'package:flutter_music/widgets/box.dart';

///搜索输入框
class SearchInput extends StatelessWidget {
  const SearchInput({
    Key? key,
    this.height = 40,
    this.hitText,
    this.autofocus,
    this.onChanged,
    this.onSubmitted,
    this.controller,
    this.onTap,
    this.onEditingComplete,
  }) : super(key: key);

  final double? height;
  final String? hitText;
  final bool? autofocus;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: ColorStyle.E0E6FD66,
        borderRadius: BorderRadius.circular(height! / 2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          hBox(10),
          const Icon(
            Icons.search,
            color: ColorStyle.B8C0D4,
            size: 24,
          ),
          hBox(10),
          _buildSearch(),
        ],
      ),
    );
  }

  _buildSearch() {
    return Expanded(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        onTap: onTap,
        onEditingComplete: onEditingComplete,
        autofocus: autofocus ?? false,
        style: Style.f3f3f316,
        decoration: InputDecoration(
          hintText: hitText ?? '搜索',
          border: InputBorder.none,
          hintStyle: Style.b8c0d414,
        ),
      ),
    );
  }
}
