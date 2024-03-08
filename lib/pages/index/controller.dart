import 'package:flutter/material.dart';
import 'package:flutter_music/base/base_get_controller.dart';
import 'package:flutter_music/pages/discover/page.dart';
import 'package:flutter_music/pages/event/page.dart';
import 'package:flutter_music/pages/mine/page.dart';
import 'package:flutter_music/pages/setting/page.dart';
import 'package:flutter_music/pages/video/page.dart';
import 'package:flutter_music/res/r.dart';
import 'package:get/get.dart';

class IndexController extends BaseGetController {
  /// 选中的页面索引
  final pageIndex = 0.obs;

  /// 页面控制器
  final pageController = PageController();

  ///页面列表
  final pageList = <Widget>[
    const DiscoverPage(),
    const VideoPage(),
    const MinePage(),
    const EventPage(),
    const SettingPage(),
  ];

  final items = <Map<String, String>>[
    {
      'image': R.images.btmDiscovery,
      'imagePrs': R.images.btmDiscoveryPrs,
      'title': '发现',
    },
    {
      'image': R.images.btmVideo,
      'imagePrs': R.images.btmVideoPrs,
      'title': '播客',
    },
    {
      'image': R.images.btmMine,
      'imagePrs': R.images.btmMinePrs,
      'title': '我的',
    },
    {
      'image': R.images.btmEvent,
      'imagePrs': R.images.btmEventPrs,
      'title': '动态',
    },
    {
      'image': R.images.btmAccount,
      'imagePrs': R.images.btmAccountPrs,
      'title': '设置',
    }
  ];

  onItemTap(int index) {
    pageIndex.value = index;
    pageController.jumpToPage(index);
  }
}
