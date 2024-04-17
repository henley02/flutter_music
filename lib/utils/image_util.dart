import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_music/utils/toast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageUtils {
  static Future<void> saveImage(String url) async {
    print('ImageUtils');
    try {
      if (!url.startsWith('http')) throw '保存失败，图片不存在！';
      PermissionStatus storageStatus = await Permission.storage.status;

      print(storageStatus);
      print(await Permission.storage.request());

      //todo 不授权的话，会有问题
      if (storageStatus != PermissionStatus.granted) {
        storageStatus = await Permission.storage.request();
        if (storageStatus != PermissionStatus.granted) {
          throw '无法存储图片，请先授权！';
        }
      }
      var response = await Dio().get(
        url,
        options: Options(responseType: ResponseType.bytes),
      );
      final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
      );
      if (result['isSuccess'] == true) {
        Toast.show('保存成功！');
      } else {
        throw result['errorMessage'];
      }
    } catch (e) {
      print(e.toString());
      Toast.show(e.toString());
    }
  }
}
