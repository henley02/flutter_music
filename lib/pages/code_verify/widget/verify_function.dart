import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/res/style.dart';

Widget verifyBg({required List<Widget> children}) {
  return Container(
    width: double.infinity,
    height: double.infinity,
    color: Colors.transparent,
    padding: const EdgeInsets.symmetric(horizontal: 25),
    margin: const EdgeInsets.only(top: 60),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    ),
  );
}

Widget backButton() {
  return const CupertinoNavigationBarBackButton(
    color: Colors.white,
  );
}

Widget verifyTitle() {
  return Text(
    '请输入验证码',
    style: Style.puhui30whitebold,
  );
}

Widget verifyDesc() {
  return Text(
    '验证码已发送至',
    style: Style.puhui14greybold,
  );
}

Widget verifyPhoneLayout({required List<Widget> children}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: children,
  );
}

Widget verifyPhone({required String phone}) {
  return Text(
    '+86 $phone',
    style: Style.puhui17grey,
  );
}
