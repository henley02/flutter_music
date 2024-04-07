import 'package:flutter/cupertino.dart';
import 'package:flutter_music/pages/index/controller.dart';
import 'package:flutter_music/pages/index/widget/bottom_item.dart';
import 'package:flutter_music/pages/index/widget/index_function.dart';
import 'package:get/get.dart';

class IndexPage extends GetView<IndexController> {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return indexBg(
      children: [
        ///滚动页面
        indexPageView(controller: controller),

        ///底部导航栏
        bottomLayout(
          items: controller.items,
          itemBuilder: (item, index) {
            return BottomItem(
              item: item,
              index: index,
              controller: controller,
              onTap: () {
                controller.onItemTap(index);
              },
            );
          },
        ),
      ],
    );
  }
}
