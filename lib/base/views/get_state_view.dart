import 'package:flutter/cupertino.dart';
import 'package:flutter_music/base/controllers/get_state_controller.dart';
import 'package:flutter_music/widgets/page_loading.dart';
import 'package:get/get.dart';

abstract class GetStateView<C extends GetStateController, S>
    extends StatefulWidget {
  const GetStateView({Key? key}) : super(key: key);

  C get controller => GetInstance().find<C>();

  @protected
  Widget build(BuildContext context, S data);

  @override
  GetStateViewState<C, S> createState() => GetStateViewState<C, S>();
}

class GetStateViewState<C extends GetStateController, S>
    extends State<GetStateView> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return widget.controller.obx(
      (S) => widget.build(context, S),
      onLoading: const PageLoading(),
    );
  }

  @override
  void dispose() {
    Get.delete<C>();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
