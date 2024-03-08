import 'package:flutter/material.dart';
import 'package:flutter_music/pages/setting/controller.dart';
import 'package:get/get.dart';

class SettingPage extends GetView<SettingController> {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SettingPage')),
      body: const Center(
        child: Text('SettingPage is working'),
      ),
    );
  }
}
