import 'package:flutter_music/base/controllers/get_state_controller.dart';
import 'package:flutter_music/models/rank_entity.dart';
import 'package:flutter_music/typedef/function.dart';

class RankController extends GetStateController<List<RankEntity>> {
  @override
  void request(ParamCallback<List<RankEntity>> success, Fail? fail) {
    requestRepository.getRank(
      success: success,
      fail: fail,
    );
  }
}
