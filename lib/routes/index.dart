import 'package:flutter_music/pages/code_verify/binding.dart';
import 'package:flutter_music/pages/code_verify/page.dart';
import 'package:flutter_music/pages/discover_module/daily_song/binding.dart';
import 'package:flutter_music/pages/discover_module/daily_song/page.dart';
import 'package:flutter_music/pages/discover_module/play_list_module/play_list/binding.dart';
import 'package:flutter_music/pages/discover_module/play_list_module/play_list/page.dart';
import 'package:flutter_music/pages/discover_module/rank/binding.dart';
import 'package:flutter_music/pages/discover_module/rank/page.dart';
import 'package:flutter_music/pages/index/binding.dart';
import 'package:flutter_music/pages/index/page.dart';
import 'package:flutter_music/pages/login/binding.dart';
import 'package:flutter_music/pages/login/page.dart';
import 'package:flutter_music/pages/splash/page.dart';
import 'package:get/get.dart';

class Routes {
  static const splash = '/';
  static const index = '/index';
  static const codeVerify = '/codeVerify';
  static const login = '/login';
  static const discover = '/discover';
  static const dailySongs = '/dailySongs';
  static const playList = '/playList';
  static const playListDetail = '/playListDetail';
  static const rank = '/rank';
  static const play = '/play';

  static final routes = <GetPage>[
    GetPage(
      name: splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: index,
      page: () => const IndexPage(),
      binding: IndexBinding(),
    ),
    GetPage(
      name: login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: codeVerify,
      page: () => const CodeVerifyPage(),
      binding: CodeVerifyBinding(),
    ),
    GetPage(
      name: dailySongs,
      page: () => const DailySongsPage(),
      binding: DailySongsBinding(),
    ),
    GetPage(
      name: rank,
      page: () => const RankPage(),
      binding: RankBinding(),
    ),
    GetPage(
      name: playList,
      page: () => const PlayListPage(),
      binding: PlayListBinding(),
    ),
  ];
}
