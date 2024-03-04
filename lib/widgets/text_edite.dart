import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_music/res/style.dart';

/// 输入框
class TextEdite extends StatelessWidget {
  /// 空文本
  final String? hintText;

  ///是否为密码
  final bool? obscureText;

  /// 输入框控制器
  final TextEditingController? controller;

  /// 是否限制只输入数字
  final bool? isNumber;

  const TextEdite({
    Key? key,
    this.hintText,
    this.obscureText = false,
    this.controller,
    this.isNumber = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 1,
      obscureText: obscureText!,
      style: Style.white18,
      keyboardType: isNumber! ? TextInputType.number : TextInputType.text,
      inputFormatters: [
        if (isNumber!)
          FilteringTextInputFormatter.allow(
            RegExp(r'[0-9]'),
          ),
      ],
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Style.white18,
        border: InputBorder.none,
      ),
    );
  }
}
