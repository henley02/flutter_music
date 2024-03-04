import 'package:flutter/material.dart';
import 'package:flutter_music/pages/login/controller.dart';
import 'package:flutter_music/res/style.dart';
import 'package:get/get.dart';

class LoginType extends StatelessWidget {
  final LoginController controller;
  final VoidCallback onTap;

  const LoginType({
    Key? key,
    required this.controller,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Obx(
        () => Text(
          controller.isPhone.value ? '账号密码登录' : '手机验证码登录',
          style: Style.puhui15white,
        ),
      ),
    );
  }
}
