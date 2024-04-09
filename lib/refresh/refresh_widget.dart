import 'package:flutter/material.dart';
import 'package:flutter_music/base/controllers/page_controller.dart';
import 'package:flutter_music/refresh/behavior.dart';
import 'package:flutter_music/res/r.dart';
import 'package:flutter_music/res/style.dart';
import 'package:flutter_music/widgets/page_loading.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshWidget<C extends BasePageController> extends StatefulWidget {
  final String? tag;

  ///是否启用上拉加载
  final bool enablePullUp;

  ///是否启用下拉刷新
  final bool enablePullDown;

  C get controller => Get.find<C>(tag: tag);

  final Widget child;

  const RefreshWidget({
    Key? key,
    this.tag,
    this.enablePullUp = true,
    this.enablePullDown = true,
    required this.child,
  }) : super(key: key);

  @override
  State<RefreshWidget> createState() => _RefreshWidgetState();
}

class _RefreshWidgetState extends State<RefreshWidget>
    with AutomaticKeepAliveClientMixin {
  ///刷新控制器
  RefreshController controller = RefreshController();

  @override
  void initState() {
    super.initState();
    widget.controller.initLoad(controller);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ///刷新控件
          _refreshWidget(),

          ///加载中
          _loadingWidget(),

          ///空页面
          _emptyWidget(),

          ///错误页面
          _errorWidget(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  _refreshWidget() {
    return Obx(() {
      return Visibility(
        visible: widget.controller.loadState.value == 1,
        child: ScrollConfiguration(
          behavior: OverScrollBehavior(),
          child: SmartRefresher(
            controller: controller,
            enablePullDown: widget.enablePullDown,
            enablePullUp: widget.enablePullUp,
            onRefresh: () => widget.controller.refreshData(controller),
            onLoading: () => widget.controller.loadMore(controller),
            child: widget.child,
          ),
        ),
      );
    });
  }

  _loadingWidget() {
    return Obx(
      () => Visibility(
        visible: widget.controller.loadState.value == 0,
        child: const PageLoading(),
      ),
    );
  }

  _emptyWidget() {
    return Obx(
      () => Visibility(
        visible: widget.controller.loadState.value == 2,
        child: Column(
          children: [
            LottieBuilder.asset(
              R.lottie.refreshEmpty,
              width: 200,
              animate: true,
              repeat: false,
            ),
            const Text(
              '暂无数据',
              style: Style.b8c0d414,
            ),
          ],
        ),
      ),
    );
  }

  _errorWidget() {
    return Obx(
      () => Visibility(
        visible: widget.controller.loadState.value == 3,
        child: Lottie.asset(
          R.lottie.refreshError,
          width: 200,
          animate: true,
        ),
      ),
    );
  }
}
