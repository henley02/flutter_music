import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/pages/discover/controller.dart';
import 'package:flutter_music/widgets/border_image.dart';
import 'package:get/get.dart';

class DiscoverBanner extends StatelessWidget {
  final DiscoverController controller;
  const DiscoverBanner({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GetBuilder<DiscoverController>(
        builder: (controller) {
          return Container(
            padding: const EdgeInsets.only(
              top: 10,
              left: 15,
              right: 15,
            ),
            height: 150,
            child: Swiper(
              autoplay: true,
              controller: SwiperController(),
              itemBuilder: (context, index) {
                return BorderImage(
                  url: controller.banners[index],
                  border: 15,
                );
              },
              itemCount: controller.banners.length,
              pagination: const SwiperPagination(
                alignment: Alignment.bottomCenter,
              ),
            ),
          );
        },
      ),
    );
  }
}
