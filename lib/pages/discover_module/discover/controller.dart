import 'package:flutter_music/base/base_get_controller.dart';
import 'package:flutter_music/models/new_song_entity.dart';
import 'package:flutter_music/models/recommend_play_list_entity.dart';
import 'package:flutter_music/res/r.dart';
import 'package:flutter_music/routes/index.dart';
import 'package:flutter_music/utils/date_util.dart';
import 'package:get/get.dart';

class DiscoverController extends BaseGetController {
  final banners = <String>[];
  final recommendPlayList = <RecommendPlayListEntity>[];
  final newSongList = <NewSongEntity>[];

  final buttons = <Map<String, dynamic>>[
    {
      'src': R.images.iconFm,
      'title': '私人FM',
      'onTap': () {
        print('私人FM');
      },
      'day': null,
    },
    {
      'src': R.images.iconDaily,
      'title': '每日推荐',
      'onTap': () => Get.toNamed(Routes.dailySongs),
      'day': DateUtil.getToday(),
    },
    {
      'src': R.images.iconPlaylist,
      'title': '歌单广场',
      'onTap': () => Get.toNamed(Routes.playList),
      'day': null,
    },
    {
      'src': R.images.iconRank,
      'title': '排行榜',
      'onTap': () => Get.toNamed(Routes.rank),
      'day': null,
    },
  ];

  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() {
    requestRepository.getBanner(
      success: (data) {
        banners.addAll(data);
        update();
      },
    );

    requestRepository.getRecommendPlayList(
      success: (data) {
        recommendPlayList.addAll(data);
        update();
      },
    );

    requestRepository.getNewSongs(
      success: (data) {
        newSongList.addAll(data);
        update();
      },
    );
  }
}
