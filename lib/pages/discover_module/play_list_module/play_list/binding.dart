import 'package:flutter_music/pages/discover_module/play_list_module/play_list/controllers/controller.dart';
import 'package:get/get.dart';

class PlayListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayListController>(() => PlayListController());
  }
}
