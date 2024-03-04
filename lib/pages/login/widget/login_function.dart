import 'package:flutter/material.dart';
import 'package:flutter_music/pages/login/controller.dart';
import 'package:flutter_music/res/style.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

Widget videoBg({required Widget child}) {
  return Scaffold(
    body: Stack(
      children: [
        GetBuilder<LoginController>(
          builder: (controller) {
            return VideoPlayer(controller.videoPlayerController);
          },
        ),
        child,
      ],
    ),
  );
}

Widget loginBox({required List<Widget> children}) {
  return SingleChildScrollView(
    padding: const EdgeInsets.fromLTRB(30, 120, 30, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    ),
  );
}

Widget loginTitle({required LoginController controller}) {
  return Obx(
    () => Text(
      controller.isPhone.value ? '手机号登录' : '账号密码登录',
      style: Style.puhui30whitebold,
    ),
  );
}

Widget loginInputArea({required List<Widget> children}) {
  return Padding(
    padding: const EdgeInsets.only(top: 25),
    child: Theme(
      data: ThemeData(
        primaryColor: Colors.red,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    ),
  );
}

Widget loginTypeLayout({required List<Widget> children}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: children,
  );
}
