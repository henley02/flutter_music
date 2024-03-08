import 'package:flutter/material.dart';
import 'package:flutter_music/pages/index/controller.dart';
import 'package:get/get.dart';

class BottomItem extends StatelessWidget {
  final int index;
  final VoidCallback onTap;
  final IndexController controller;
  final Map<String, String> item;

  const BottomItem({
    Key? key,
    required this.index,
    required this.onTap,
    required this.controller,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Obx(
          () {
            return Stack(
              children: [
                Image.asset(
                  controller.pageIndex.value == index
                      ? item['imagePrs']!
                      : item['image']!,
                ),
                Positioned(
                  left: 20,
                  bottom: 5,
                  child: Text(
                    item['title']!,
                    style: TextStyle(
                      color: controller.pageIndex.value == index
                          ? Colors.white
                          : Colors.white54,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
