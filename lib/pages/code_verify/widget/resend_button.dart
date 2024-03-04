import 'package:flutter/cupertino.dart';
import 'package:flutter_music/pages/code_verify/controller.dart';
import 'package:flutter_music/res/style.dart';
import 'package:get/get.dart';

class ResendButton extends StatelessWidget {
  final CodeVerifyController controller;
  final VoidCallback onTap;

  const ResendButton({
    Key? key,
    required this.controller,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: onTap,
        child: Text(
          controller.count.value == 0
              ? '重发验证码'
              : '${controller.count.value}s后重发',
          style: Style.grey19,
        ),
      ),
    );
  }
}
