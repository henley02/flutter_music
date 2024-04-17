import 'package:flutter_music/base/controllers/page_controller.dart';
import 'package:flutter_music/models/creator_entity.dart';
import 'package:flutter_music/typedef/function.dart';
import 'package:get/get.dart';

class SubscriberController extends BasePageController<CreatorEntity> {
  int id = Get.arguments;

  @override
  request(ParamDoubleCallback<List<CreatorEntity>, bool> success, Fail? fail) {
    requestRepository.getPlayListSubscribers(
      id: id,
      offset: page,
      success: (data) => success(data, data.length < 21),
      fail: fail,
    );
  }
}
