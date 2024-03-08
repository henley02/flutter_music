import 'package:flutter/material.dart';
import 'package:flutter_music/pages/mine/controller.dart';
import 'package:get/get.dart';

class MinePage extends GetView<MineController> {
  const MinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MinePage')),
      body: const Center(
        child: Text('MinePage is working'),
      ),
    );
  }
}
