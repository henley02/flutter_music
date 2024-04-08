import 'package:flutter_music/pages/discover_module/daily_song/controller.dart';
import 'package:get/get.dart';

class DailySongsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DailySongsController>(() => DailySongsController());
  }
}
