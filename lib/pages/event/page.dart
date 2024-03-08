import 'package:flutter/material.dart';
import 'package:flutter_music/pages/event/controller.dart';
import 'package:get/get.dart';

class EventPage extends GetView<EventController> {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EventPage')),
      body: const Center(
        child: Text('EventPage is working'),
      ),
    );
  }
}
