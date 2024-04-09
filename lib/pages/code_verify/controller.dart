import 'dart:async';

import 'package:flutter_music/base/controllers/base_get_controller.dart';
import 'package:flutter_music/routes/index.dart';
import 'package:flutter_music/utils/sp_util.dart';
import 'package:flutter_music/utils/toast.dart';
import 'package:get/get.dart';

class CodeVerifyController extends BaseGetController {
  late String phone = '';

  final count = 60.obs;
  late Timer timer;

  @override
  void onInit() {
    phone = Get.arguments;
    startTime();
    super.onInit();
  }

  @override
  dispose() {
    timer.cancel();
    super.dispose();
  }

  startTime() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (count.value == 0) {
          timer.cancel();
        } else {
          count.value--;
        }
      },
    );
  }

  onResend() {
    if (count.value == 0) {
      count.value = 60;
      requestRepository.sendCode(
        phone: phone,
        success: (data) {
          startTime();
          if (data) {
            Toast.show('发送成功');
          } else {
            Toast.show('发送失败');
          }
        },
        fail: (msg) => Toast.show(msg),
      );
    } else {
      Toast.show('请稍后再试');
    }
  }

  onSubmitted(int code) {
    requestRepository.verifyCode(
      phone: phone,
      captcha: code.toString(),
      success: (data) {
        if (data) {
          requestRepository.captchaLogin(
            phone: phone,
            captcha: code.toString(),
            success: (cookie) {
              SpUtil.cookie = cookie;
              Get.offAndToNamed(Routes.index);
            },
            fail: (msg) => Toast.show(msg),
          );
        } else {
          Toast.show('验证码错误');
        }
      },
    );
  }
}
