import 'package:dio/dio.dart';

class HttpException {
  static String handleException(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return "请求取消";
      case DioExceptionType.connectionTimeout:
        return "连接超时";
      case DioExceptionType.sendTimeout:
        return "请求超时";
      case DioExceptionType.receiveTimeout:
        return "响应超时";
      case DioExceptionType.badResponse:
        return "出现异常";
      case DioExceptionType.connectionError:
        return "连接异常";
      default:
        return "未知错误";
    }
  }
}
