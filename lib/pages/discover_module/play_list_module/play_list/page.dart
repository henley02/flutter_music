import 'package:flutter/material.dart';
import 'package:flutter_music/base/views/get_state_view.dart';
import 'package:flutter_music/pages/discover_module/play_list_module/play_list/controllers/controller.dart';
import 'package:flutter_music/pages/discover_module/play_list_module/play_list/widget/play_list_function.dart';

class PlayListPage extends GetStateView<PlayListController, List<String>> {
  const PlayListPage({super.key});

  @override
  Widget build(BuildContext context, List<String> data) {
    return playListBg(
      tabs: data,
      tabController: controller.tabController,
      body: bodyLayout(
        tabController: controller.tabController,
        children: controller.pages,
      ),
    );
  }
}
