import 'package:flutter/material.dart';
import 'package:flutter_music/pages/code_verify/controller.dart';
import 'package:flutter_music/pages/code_verify/widget/code_input.dart';
import 'package:flutter_music/pages/code_verify/widget/resend_button.dart';
import 'package:flutter_music/pages/code_verify/widget/verify_function.dart';
import 'package:flutter_music/pages/login/widget/login_function.dart';
import 'package:flutter_music/widgets/box.dart';
import 'package:get/get.dart';

class CodeVerifyPage extends GetView<CodeVerifyController> {
  const CodeVerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return videoBg(
      child: verifyBg(
        children: [
          ///返回按钮
          backButton(),

          vBox(25),

          ///标题
          verifyTitle(),

          vBox(25),

          ///描述
          verifyDesc(),

          vBox(10),

          verifyPhoneLayout(
            children: [
              ///手机号码
              verifyPhone(phone: controller.phone),

              ///重发按钮
              ResendButton(
                controller: controller,
                onTap: controller.onResend,
              ),
            ],
          ),

          vBox(50),

          /// 验证码输入框
          CodeInput(
            onCodeComplete: (code) => controller.onSubmitted(code),
          ),
        ],
      ),
    );
  }
}
