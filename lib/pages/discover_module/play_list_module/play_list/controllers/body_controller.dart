import 'package:flutter_music/base/controllers/page_controller.dart';
import 'package:flutter_music/models/play_list_entity.dart';
import 'package:flutter_music/typedef/function.dart';

class PlayListBodyController extends BasePageController<PlayListEntity> {
  final String cat;

  PlayListBodyController({required this.cat});

  @override
  request(ParamDoubleCallback<List<PlayListEntity>, bool> success, Fail? fail) {
    print('PlayListBodyController, request, cat: $cat, page: $page');
    requestRepository.getPlayList(
      cat: cat,
      offset: page,
      success: (data) {
        success(data, data.length < 21);
      },
      fail: fail,
    );
  }
}
