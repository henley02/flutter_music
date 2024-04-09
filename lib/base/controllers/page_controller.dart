import 'package:flutter_music/base/controllers/base_get_controller.dart';
import 'package:flutter_music/refresh/page_state.dart';
import 'package:flutter_music/refresh/refresh_extension.dart';
import 'package:flutter_music/typedef/function.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class BasePageController<M> extends BaseGetController {
  ///加载状态 0:初次加载中 1:加载成功 2:加载为空 3:加载失败
  var loadState = 0.obs;

  ///分页数
  int page = 0;

  ///数据
  List<M> data = [];
  bool isInit = true;

  ///控制器
  ///
  late RefreshController refreshController;

  ///加载成功展示页面
  showSuccess(List data) {
    loadState.value = data.isNotEmpty ? 1 : 2;
  }

  ///加载失败展示页面
  showError() {
    loadState.value = 3;
  }

  ///重新加载
  reload() {
    loadState.value = 0;
  }

  ///初次加载
  initLoad(RefreshController controller) {
    if (isInit) {
      this.refreshController = controller;
      isInit = false;
      _requestData(controller);
    }
  }

  ///加载更多
  loadMore(RefreshController controller) {
    page++;
    print('loadMore $page');
    _requestData(controller, refresh: Refresh.pullUp);
  }

  ///刷新
  refreshData(RefreshController controller) {
    page = 0;
    print('refreshData $page');
    _requestData(controller, refresh: Refresh.pullDown);
  }

  ///获取数据
  _requestData(RefreshController controller,
      {Refresh refresh = Refresh.first}) {
    request(
      (data, over) {
        RefreshExtension.onSuccess(controller, refresh, over);
        if (refresh == Refresh.pullDown) {
          this.data.clear();
        }
        this.data.addAll(data);
        showSuccess(data);
        update();
      },
      (msg) {
        showError();
        RefreshExtension.onError(controller, refresh);
      },
    );
  }

  request(ParamDoubleCallback<List<M>, bool> success, Fail? fail);
}
