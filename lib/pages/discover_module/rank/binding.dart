import 'package:flutter_music/pages/discover_module/rank/controller.dart';
import 'package:get/get.dart';

class RankBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RankController>(() => RankController());
  }
}
