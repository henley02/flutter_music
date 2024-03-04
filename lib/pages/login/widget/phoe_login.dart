import 'package:flutter/material.dart';
import 'package:flutter_music/pages/login/controller.dart';
import 'package:flutter_music/res/style.dart';
import 'package:flutter_music/widgets/box.dart';
import 'package:flutter_music/widgets/text_edite.dart';

class PhoneLogin extends StatelessWidget {
  final LoginController controller;

  const PhoneLogin({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(),
        vBox(12),
        _input(),
      ],
    );
  }

  _input() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          '+86',
          style: Style.white20,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextEdite(
              controller: controller.phoneController,
              hintText: '请输入手机号',
              isNumber: true,
            ),
          ),
        ),
      ],
    );
  }

  _title() {
    return const Text(
      '国家地区 中国',
      style: Style.white20,
    );
  }
}
