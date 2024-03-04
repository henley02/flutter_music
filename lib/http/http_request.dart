import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_music/http/http_exception.dart';
import 'package:flutter_music/http/request_api.dart';
import 'package:flutter_music/typedef/function.dart';
import 'package:flutter_music/utils/sp_util.dart';
import 'package:flutter_music/utils/toast.dart';

/// 超时时间
const Duration connectionTimeout = Duration(milliseconds: 10000);

/// 接收超时时间
const Duration receiveTimeout = Duration(milliseconds: 10000);

/// 发送超时时间
const Duration sendTimeout = Duration(milliseconds: 10000);

class HttpRequest {
  static Dio? _dio;

  static Dio createInstance([bool isJson = false]) {
    if (_dio == null) {
      var opt = BaseOptions(
        contentType: isJson
            ? Headers.jsonContentType
            : Headers.formUrlEncodedContentType,
        validateStatus: (status) {
          return true;
        },
        connectTimeout: connectionTimeout,
        receiveTimeout: receiveTimeout,
        sendTimeout: sendTimeout,
        baseUrl: RequestApi.BASE_URL,
      );
      _dio = Dio(opt);
    }
    _dio?.options.contentType =
        isJson ? Headers.jsonContentType : Headers.formUrlEncodedContentType;
    return _dio!;
  }

  static Future request<T>(
    HttpMethod method,
    String path, {
    Map<String, dynamic>? params,
    dynamic? data,
    String? baseUrl,
    bool isJson = false,
    Success? success,
    Fail? fail,
  }) async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        Toast.show("网络连接失败，请检查网络");
        return;
      }
      if (connectivityResult == ConnectivityResult.mobile) {
        print('I am connected to a mobile network.');
      } else if (connectivityResult == ConnectivityResult.wifi) {
        print('I am connected to a wifi network.');
      }

      var dio = createInstance(isJson);
      if (baseUrl != null) {
        dio.options.baseUrl = baseUrl;
      }
      if (SpUtil.checkLogin) {
        if (params == null) {
          params = {'cookie': SpUtil.cookie};
        } else {
          params['cookie'] = SpUtil.cookie;
        }
      }

      Response response = await dio.request(
        path,
        data: data,
        queryParameters: params,
        options: Options(
          method: _methodValues[method],
        ),
      );

      if (success != null) {
        success(response.data);
      }
    } on DioException catch (e) {
      String msg = HttpException.handleException(e);
      if (fail != null) {
        fail(msg);
      }
    }
  }
}

/// 请求类型枚举
enum HttpMethod {
  GET,
  POST,
}

///请求类型值
const _methodValues = {
  HttpMethod.GET: 'get',
  HttpMethod.POST: 'post',
};
