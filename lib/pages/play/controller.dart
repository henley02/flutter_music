import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_music/base/controllers/base_get_controller.dart';
import 'package:flutter_music/utils/string_util.dart';
import 'package:get/get.dart';

class PlayController extends BaseGetController
    with GetTickerProviderStateMixin {
  /// 封面旋转控制器
  late AnimationController _roundController;

  ///唱针控制器
  late AnimationController _stylusController;

  late Animation<double> _stylusAnimation;

  String commentCount = '0';

  bool isLiked = false;

  @override
  void onInit() {
    _roundController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );

    _stylusController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _stylusAnimation = Tween<double>(
      begin: -0.01,
      end: -0.1,
    ).animate(_stylusController);

    _roundController.addStatusListener((status) {
      // 转完一圈之后继续
      if (status == AnimationStatus.completed) {
        _roundController.reset();
        _roundController.forward();
      }
    });
    super.onInit();
  }

  Animation<double> get stylusAnimation => _stylusAnimation;
  Animation<double> get roundController => _roundController;

  @override
  void onClose() {
    _roundController.dispose();
    _stylusController.dispose();
    super.onClose();
  }

  void getCommentCount(int id) {
    requestRepository.getSongComment(
      id: id,
      offset: 0,
      success: (data) {
        commentCount = StringUtil.formatCommentCount(data.total);
        update(['commentCount']);
      },
    );
  }

  onStateChanged(PlayerState state) {
    print('state:$state');

    ///通过播放器状态判断动画的停止与进行
    if (state == PlayerState.playing) {
      _roundController.forward();
      _stylusController.reverse();
    } else {
      _roundController.stop();
      _stylusController.forward();
    }
  }
}
