import 'package:flutter/cupertino.dart';
import 'package:flutter_music/base/controllers/get_state_controller.dart';
import 'package:flutter_music/models/play_list_detail_song_entity.dart';
import 'package:flutter_music/typedef/function.dart';
import 'package:get/get.dart';

class DailySongsController
    extends GetStateController<List<PlayListDetailSongEntity>> {
  final scroller = ScrollController();
  final offset = 0.0.obs;

  @override
  void onInit() {
    scroller.addListener(() {
      offset.value = scroller.offset;
    });
    super.onInit();
  }

  @override
  void request(
    ParamCallback<List<PlayListDetailSongEntity>> success,
    Fail? fail,
  ) {
    requestRepository.getDailySong(
      success: success,
      fail: fail,
    );
  }
}
