import 'package:flutter_music/pages/code_verify/binding.dart';
import 'package:flutter_music/pages/code_verify/page.dart';
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
  ];
}
