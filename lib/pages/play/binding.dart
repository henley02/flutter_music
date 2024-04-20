import 'package:flutter_music/pages/play/controller.dart';
import 'package:get/get.dart';

class PlayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayController>(() => PlayController());
  }
}
