import 'package:flutter/material.dart';
import 'package:flutter_music/pages/login/controller.dart';
import 'package:flutter_music/res/style.dart';
import 'package:get/get.dart';

class LoginForget extends StatelessWidget {
  final VoidCallback onTap;
  final LoginController controller;

  const LoginForget({
    Key? key,
    required this.onTap,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isPhone.value
          ? const SizedBox()
          : GestureDetector(
              onTap: onTap,
              child: Text(
                '忘记密码',
                style: Style.puhui15grey,
              ),
            ),
    );
  }
}
