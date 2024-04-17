import 'package:flutter_music/pages/discover_module/play_list_module/subscriber/controller.dart';
import 'package:get/get.dart';

class SubscriberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubscriberController>(() => SubscriberController());
  }
}
