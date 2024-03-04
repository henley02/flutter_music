import 'package:flutter_music/pages/code_verify/controller.dart';
import 'package:get/get.dart';

class CodeVerifyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CodeVerifyController>(() => CodeVerifyController());
  }
}
