import 'package:flutter_music/http/request_repository.dart';
import 'package:get/get.dart';

class BaseGetController extends GetxController {
  late RequestRepository requestRepository;
  @override
  void onInit() {
    requestRepository = Get.find<RequestRepository>();
    super.onInit();
  }
}
