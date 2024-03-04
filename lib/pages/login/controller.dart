import 'package:flutter/cupertino.dart';
import 'package:flutter_music/base/base_get_controller.dart';
import 'package:flutter_music/res/r.dart';
import 'package:flutter_music/routes/index.dart';
import 'package:flutter_music/utils/sp_util.dart';
import 'package:flutter_music/utils/toast.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class LoginController extends BaseGetController {
  /// 手机号码
  final phoneController = TextEditingController();

  /// 账号
  final accountController = TextEditingController();

  /// 密码
  final passwordController = TextEditingController();

  /// 视频控制器
  late VideoPlayerController videoPlayerController;

  /// 登录类型是否为手机
  final isPhone = true.obs;

  @override
  void onInit() {
    super.onInit();
    videoPlayerController = VideoPlayerController.asset(R.videos.loginVideo)
      ..initialize().then((_) {
        videoPlayerController.setLooping(true);
        videoPlayerController.play();
        update();
      });
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  login() {
    if (isPhone.value) {
      //手机号登录
      var phone = phoneController.text;
      if (phone.isEmpty) {
        Toast.show('请输入手机号');
        return;
      }
      requestRepository.sendCode(
        phone: phone,
        success: (data) {
          if (data) {
            Get.toNamed(
              Routes.codeVerify,
              arguments: phone,
            );
            phoneController.clear();
          } else {
            Toast.show('发送验证码失败');
          }
        },
        fail: (msg) {
          Toast.show(msg);
        },
      );
    } else {
      //账号密码登录
      var account = accountController.text;
      var password = passwordController.text;
      if (account.isEmpty || password.isEmpty) {
        Toast.show('请输入账号或密码');
        return;
      }
      if (account.endsWith('@163.com')) {
        requestRepository.emailLogin(
          email: account,
          password: password,
          success: (data) {
            intentPage(data);
          },
          fail: (msg) {
            Toast.show(msg);
          },
        );
        return;
      } else {
        requestRepository.phoneLogin(
          phone: account,
          password: password,
          success: (data) {
            intentPage(data);
          },
          fail: (msg) {
            Toast.show(msg);
          },
        );
      }
    }
  }

  void intentPage(String cookie) {
    SpUtil.cookie = cookie;
    Toast.show('登录成功');
    Get.offAllNamed(Routes.index);
  }
}
