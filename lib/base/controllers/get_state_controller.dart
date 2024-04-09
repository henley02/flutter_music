import 'package:flutter_music/base/controllers/base_get_controller.dart';
import 'package:flutter_music/typedef/function.dart';
import 'package:get/get.dart';

abstract class GetStateController<S> extends BaseGetController
    with StateMixin<S> {
  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    super.onInit();
    request(
      (S) => change(S, status: RxStatus.success()),
      (message) => change(null, status: RxStatus.error(message)),
    );
  }

  void request(ParamCallback<S> success, Fail? fail);
}
