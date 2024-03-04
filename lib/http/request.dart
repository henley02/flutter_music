import 'package:flutter_music/http/http_request.dart';
import 'package:flutter_music/typedef/function.dart';
import 'package:flutter_music/utils/toast.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

///请求类
class Request {
  /// 发起get请求
  /// [path] 请求路径
  /// [params] 请求参数
  /// [baseUrl] 请求基础路径
  /// [isJson] 是否是json请求
  /// [success] 请求成功回调
  /// [fail] 请求失败回调
  /// [isShowLoading] 是否显示加载框
  static void get<T>(
    String path, {
    Map<String, dynamic>? params,
    String? baseUrl,
    bool isJson = false,
    Success<T>? success,
    Fail? fail,
    bool isShowLoading = true,
  }) async {
    _request<T>(
      HttpMethod.GET,
      path,
      params: params,
      baseUrl: baseUrl,
      isJson: isJson,
      success: success,
      fail: fail,
      isShowLoading: isShowLoading,
    );
  }

  /// 发起post请求
  /// [path] 请求路径
  /// [params] 请求参数
  /// [data] POST请求体
  /// [baseUrl] 请求基础路径
  /// [isJson] 是否是json请求
  /// [success] 请求成功回调
  /// [fail] 请求失败回调
  /// [isShowLoading] 是否显示加载框
  static void post<T>(
    String path, {
    Map<String, dynamic>? params,
    dynamic data,
    String? baseUrl,
    bool isJson = false,
    Success<T>? success,
    Fail? fail,
    bool isShowLoading = true,
  }) {
    _request<T>(
      HttpMethod.POST,
      path,
      params: params,
      data: data,
      baseUrl: baseUrl,
      isJson: isJson,
      success: success,
      fail: fail,
      isShowLoading: isShowLoading,
    );
  }

  ///发起请求
  ///[method] 请求方法
  ///[path] 请求路径
  ///[params] 请求参数
  ///[data] POST请求体
  ///[baseUrl] 请求基础路径
  ///[isJson] 是否是json请求
  ///[success] 请求成功回调
  ///[fail] 请求失败回调
  ///[isShowLoading] 是否显示加载框
  static void _request<T>(
    HttpMethod method,
    String path, {
    Map<String, dynamic>? params,
    dynamic? data,
    String? baseUrl,
    bool isJson = false,
    bool isShowLoading = true,
    Success<T>? success,
    Fail? fail,
  }) async {
    if (isShowLoading) {
      Toast.showLoading();
    }
    HttpRequest.request(
      method,
      path,
      params: params,
      data: data,
      baseUrl: baseUrl,
      isJson: isJson,
      success: (data) {
        if (isShowLoading) {
          SmartDialog.dismiss(status: SmartStatus.loading);
        }
        if (success != null) {
          success(data);
        }
      },
      fail: (msg) {
        if (isShowLoading) {
          SmartDialog.dismiss(status: SmartStatus.loading);
        }
        if (fail != null) {
          fail(msg);
        } else {
          Toast.show(msg);
        }
      },
    );
  }
}
