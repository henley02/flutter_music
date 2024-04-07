import 'package:flutter_music/http/request.dart';
import 'package:flutter_music/http/request_api.dart';
import 'package:flutter_music/models/new_song_entity.dart';
import 'package:flutter_music/models/recommend_play_list_entity.dart';
import 'package:flutter_music/typedef/function.dart';

class RequestRepository {
  /// 发送验证码
  /// [phone] 手机号
  sendCode({
    required String phone,
    Success<bool>? success,
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.sendCode,
      params: {
        'phone': phone,
      },
      success: (data) {
        if (data['code'] == 200) {
          if (success != null) {
            success(true);
          }
        } else {
          if (success != null) {
            success(false);
          }
        }
      },
      fail: fail,
    );
  }

  ///验证验证码
  /// [phone] 手机号
  /// [captcha] 验证码
  /// [success] 成功回调
  /// [fail] 失败回调
  verifyCode({
    required String phone,
    required String captcha,
    Success<bool>? success,
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.verifyCode,
      params: {
        'phone': phone,
        'captcha': captcha,
      },
      success: (data) {
        if (data['code'] == 200) {
          if (success != null) {
            success(true);
          }
        } else {
          if (success != null) {
            success(false);
          }
        }
      },
      fail: fail,
    );
  }

  /// 邮箱登录
  /// [email] 邮箱
  /// [password] 密码
  /// [success] 成功回调
  /// [fail] 失败回调
  emailLogin({
    required String email,
    required String password,
    Success<String>? success,
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.login,
      params: {
        'email': email,
        'password': password,
      },
      success: (data) {
        //如果正确会返回cookie
        if (data['code'] == 200) {
          if (success != null) {
            success(data['cookie']);
          }
        } else {
          if (fail != null) {
            fail(data['message']);
          }
        }
      },
      fail: fail,
    );
  }

  /// 手机登录
  /// [phone] 手机号
  /// [password] 密码
  /// [success] 成功回调
  /// [fail] 失败回调
  phoneLogin({
    required String phone,
    required String password,
    Success<String>? success,
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.login,
      params: {
        'phone': phone,
        'password': password,
      },
      success: (data) {
        //如果正确会返回cookie
        if (data['code'] == 200) {
          if (success != null) {
            success(data['cookie']);
          }
        } else {
          if (fail != null) {
            fail(data['message']);
          }
        }
      },
      fail: fail,
    );
  }

  /// 手机验证码登录
  /// [phone] 手机号
  /// [captcha] 验证码
  /// [success] 成功回调
  /// [fail] 失败回调
  captchaLogin({
    required String phone,
    required String captcha,
    Success<String>? success,
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.phoneLogin,
      params: {
        'phone': phone,
        'captcha': captcha,
      },
      success: (data) {
        //如果正确会返回cookie
        if (data['code'] == 200) {
          if (success != null) {
            success(data['cookie']);
          }
        } else {
          if (fail != null) {
            fail(data['message']);
          }
        }
      },
      fail: fail,
    );
  }

  /// 获取网友精选碟歌单
  /// [order] 可选值为 'new' 和 'hot', 分别对应最新和最热 , 默认为 'hot'
  /// [cat] tag, 比如 " 华语 "、" 古风 " 、" 欧美 "、" 流行 ", 默认为 "全部",可从歌单分类接口获取(/playlist/catlist)
  /// [limit] 取出歌单数量 , 默认为 50
  /// [offset] 偏移数量 , 用于分页 , 如 :( 评论页数 -1)*50, 其中 50 为 limit 的值
  getPlayList({
    String cat = '华语',
    int offset = 0,
    int limit = 10,
    String order = 'hot',
    Success? success,
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.playlist,
      isShowLoading: true,
      params: {
        'cat': cat,
        'limit': limit,
        'offset': '${offset * limit}',
        'order': order,
      },
      success: success,
      fail: fail,
    );
  }

  ///获取轮播图
  getBanner({
    Success<List<String>>? success,
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.banner,
      isShowLoading: false,
      success: (data) {
        if (data['code'] == 200) {
          var result = <String>[];
          data['banners'].forEach((item) {
            result.add(item['pic']);
          });
          if (success != null) {
            success(result);
          }
        } else {
          if (fail != null) {
            fail('获取轮播图失败');
          }
        }
      },
      fail: fail,
    );
  }

  ///推荐歌单
  getRecommendPlayList({
    Success<List<RecommendPlayListEntity>>? success,
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.recomPlays,
      isShowLoading: false,
      success: (data) {
        if (data['code'] == 200) {
          var result = <RecommendPlayListEntity>[];
          data['recommend'].forEach((item) {
            result.add(
              RecommendPlayListEntity.fromJson(item),
            );
          });
          if (success != null) {
            success(result);
          }
        } else {
          if (fail != null) {
            fail('获取推荐歌单失败');
          }
        }
      },
      fail: fail,
    );
  }

  ///推荐新音乐
  getNewSongs({
    Fail? fail,
    Success<List<NewSongEntity>>? success,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.newSong,
      isShowLoading: false,
      success: (data) {
        if (data['code'] == 200) {
          var result = <NewSongEntity>[];
          data['result'].forEach((item) {
            result.add(
              NewSongEntity.fromJson(item),
            );
          });
          if (success != null) {
            success(result);
          }
        } else {
          if (fail != null) {
            fail('获取推荐新音乐失败');
          }
        }
      },
      fail: fail,
    );
  }

  refreshLogin({
    Success<String>? success,
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.refreshLogin,
      isShowLoading: false,
      success: (data) {
        if (data['code'] == 200) {
          success!(data['cookie']);
        } else {
          if (fail != null) {
            fail('');
          }
        }
      },
      fail: fail,
    );
  }
}
