import 'package:flutter_music/pages/discover_module/play_list_module/play_list_detail/controller.dart';
import 'package:get/get.dart';

class PlayListDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayListDetailController>(() => PlayListDetailController());
  }
}
