import 'package:flutter_music/http/request_repository.dart';
import 'package:get/get.dart';

class Inject {
  static void init() {
    Get.put<RequestRepository>(RequestRepository());
  }
}
