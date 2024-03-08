import 'package:flutter_music/pages/discover/controller.dart';
import 'package:flutter_music/pages/event/controller.dart';
import 'package:flutter_music/pages/index/controller.dart';
import 'package:flutter_music/pages/mine/controller.dart';
import 'package:flutter_music/pages/video/controller.dart';
import 'package:get/get.dart';

class IndexBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IndexController>(() => IndexController());
    Get.lazyPut<VideoController>(() => VideoController());
    Get.lazyPut<MineController>(() => MineController());
    Get.lazyPut<DiscoverController>(() => DiscoverController());
    Get.lazyPut<EventController>(() => EventController());
  }
}
