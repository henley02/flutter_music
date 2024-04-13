import 'package:flutter_music/base/controllers/play_music_controller.dart';
import 'package:flutter_music/http/request_repository.dart';
import 'package:flutter_music/theme/theme_controller.dart';
import 'package:get/get.dart';

class Inject {
  static void init() {
    Get.put<RequestRepository>(RequestRepository());
    Get.put<ThemeController>(ThemeController());
    Get.put<PlayMusicController>(PlayMusicController());
  }
}
