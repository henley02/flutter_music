import 'package:flutter/material.dart';
import 'package:flutter_music/pages/discover/controller.dart';
import 'package:get/get.dart';

class DiscoverPage extends GetView<DiscoverController> {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DiscoverPage')),
      body: const Center(
        child: Text('DiscoverPage is working'),
      ),
    );
  }
}
