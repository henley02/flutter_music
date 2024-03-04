import 'package:flutter/material.dart';
import 'package:flutter_music/pages/login/controller.dart';
import 'package:flutter_music/widgets/box.dart';
import 'package:flutter_music/widgets/text_edite.dart';

class AccountLogin extends StatelessWidget {
  final LoginController controller;
  const AccountLogin({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _accountInput(),
        vBox(12),
        _passwordInput(),
      ],
    );
  }

  _accountInput() {
    return TextEdite(
      hintText: '邮箱/手机号',
      controller: controller.accountController,
    );
  }

  _passwordInput() {
    return TextEdite(
      hintText: '密码',
      controller: controller.passwordController,
      obscureText: true,
    );
  }
}
