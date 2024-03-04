import 'package:flutter/material.dart';
import 'package:flutter_music/pages/login/controller.dart';
import 'package:flutter_music/pages/login/widget/account_login.dart';
import 'package:flutter_music/pages/login/widget/login_button.dart';
import 'package:flutter_music/pages/login/widget/login_forget.dart';
import 'package:flutter_music/pages/login/widget/login_function.dart';
import 'package:flutter_music/pages/login/widget/login_type.dart';
import 'package:flutter_music/pages/login/widget/phoe_login.dart';
import 'package:flutter_music/widgets/box.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 登录视频背景
    return videoBg(
      child: loginBox(
        children: [
          ///标题
          loginTitle(controller: controller),

          loginInputArea(
            children: [
              Obx(
                () => controller.isPhone.value
                    ? PhoneLogin(controller: controller)
                    : AccountLogin(controller: controller),
              ),

              vBox(28),

              /// 登录按钮
              LoginButton(
                onTap: controller.login,
              ),
              vBox(25),
              loginTypeLayout(
                children: [
                  ///切换登录方式
                  LoginType(
                    controller: controller,
                    onTap: () => controller.isPhone.toggle(),
                  ),

                  ///忘记密码
                  LoginForget(
                    controller: controller,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
