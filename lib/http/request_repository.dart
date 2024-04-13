import 'package:flutter_music/http/request.dart';
import 'package:flutter_music/http/request_api.dart';
import 'package:flutter_music/models/new_song_entity.dart';
import 'package:flutter_music/models/play_list_detail_entity.dart';
import 'package:flutter_music/models/play_list_detail_song_entity.dart';
import 'package:flutter_music/models/play_list_entity.dart';
import 'package:flutter_music/models/rank_entity.dart';
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
  ///[cat]歌单分类
  ///[success]成功回调
  ///[fail]失败回调
  ///[limit]每页数量
  ///[offset]偏移量
  ///[order]排序方式order: 可选值为 'new' 和 'hot', 分别对应最新和最热 , 默认为 'hot'
  getPlayList({
    required String cat,
    required int offset,
    int limit = 21,
    required Success<List<PlayListEntity>> success,
    String order = 'hot',
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.playlist,
      isShowLoading: false,
      params: {
        'cat': cat,
        'limit': limit,
        'offset': '${offset * limit}',
        'order': order,
      },
      success: (data) {
        if (data['code'] == 200) {
          var result = <PlayListEntity>[];
          data['playlists'].forEach((element) {
            result.add(
              PlayListEntity.fromJson(element),
            );
          });
          success(result);
        } else {
          if (fail != null) {
            fail('获取歌单列表失败');
          }
        }
      },
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

  ///获取每日推荐歌曲
  /// [success] 成功回调
  /// [fail] 失败回调
  getDailySong({Success<List<PlayListDetailSongEntity>>? success, Fail? fail}) {
    Request.get<Map<String, dynamic>>(
      RequestApi.dailySongs,
      isShowLoading: false,
      success: (data) {
        if (data['code'] == 200) {
          if (success != null) {
            var result = <PlayListDetailSongEntity>[];
            data['data']['dailySongs'].forEach((item) {
              result.add(
                PlayListDetailSongEntity.fromJson(item),
              );
            });
            success(result);
          }
        } else {
          if (fail != null) {
            fail('获取每日推荐歌曲失败');
          }
        }
      },
      fail: fail,
    );
  }

  ///获取排行榜
  getRank({
    Success<List<RankEntity>>? success,
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.rank,
      isShowLoading: false,
      success: (data) {
        if (data['code'] == 200) {
          if (success != null) {
            var topList = <RankEntity>[];
            data['list'].forEach((item) {
              topList.add(
                RankEntity.fromJson(item),
              );
            });
            success(topList);
          }
        } else {
          if (fail != null) {
            fail('获取榜单失败');
          }
        }
      },
      fail: fail,
    );
  }

  ///获取歌曲播放链接
  ///[id]歌曲id
  ///[br]码率
  ///[success]成功
  ///[fail]失败
  getSongUrl({
    required int id,
    Success<String>? success,
  }) {
    var params = {
      'id': id.toString(),
    };
    Request.get<Map<String, dynamic>>(
      RequestApi.songUrl,
      params: params,
      isShowLoading: false,
      success: (data) {
        if (success != null) {
          success(data['data'][0]['url']);
        }
      },
    );
  }

  ///获取歌单分类列表
  getPlayListCatList({
    required Success<List<String>> success,
    Fail? fail,
  }) {
    Request.get<Map<String, dynamic>>(
      RequestApi.playlistCatlist,
      isShowLoading: false,
      success: (data) {
        if (data['code'] == 200) {
          var result = <String>[];
          data['tags'].forEach((element) {
            result.add(
              element['name'],
            );
          });
          success(result);
        } else {
          if (fail != null) {
            fail('获取歌单分类列表失败');
          }
        }
      },
      fail: fail,
    );
  }

  ///获取歌单详情
  ///[id]
  ///[s]歌单最近的 s 个收藏者,默认为 8
  ///[success]成功
  ///[fail]失败
  getPlayListDetail({
    required int id,
    int? s,
    Success<PlayListDetailEntity>? success,
    Fail? fail,
  }) {
    var params = {
      'id': id.toString(),
      's': s,
    };

    Request.get<Map<String, dynamic>>(
      RequestApi.playListDetail,
      isShowLoading: false,
      params: params,
      success: (data) {
        if (data['code'] == 200) {
          if (success != null) {
            success(PlayListDetailEntity.fromJson(data['playlist']));
          }
        }
      },
      fail: fail,
    );
  }

  ///获取歌单详情所有歌曲
  ///[id]
  ///[limit]
  ///[offset]
  ///[success]成功
  ///[fail]失败
  getPlayListDetailSongs({
    required int id,
    required int offset,
    int limit = 21,
    Success<List<PlayListDetailSongEntity>>? success,
    Fail? fail,
  }) {
    var params = {
      'id': id.toString(),
      'limit': limit.toString(),
      'offset': '${offset * limit}',
    };
    Request.get<Map<String, dynamic>>(
      RequestApi.playListTrackAll,
      isShowLoading: false,
      params: params,
      success: (data) {
        if (data['code'] == 200) {
          if (success != null) {
            var result = <PlayListDetailSongEntity>[];
            data['songs'].forEach((element) {
              result.add(
                PlayListDetailSongEntity.fromJson(element),
              );
            });
            success(result);
          }
        } else {
          if (fail != null) {
            fail('获取歌单详情失败');
          }
        }
      },
      fail: fail,
    );
  }

  ///获取相关歌单推荐
  ///[id]
  ///[success]成功
  ///[fail]失败
  getRelatedPlayList({
    required int id,
    Success<List<PlayListEntity>>? success,
    Fail? fail,
  }) {
    var params = {
      'id': id.toString(),
    };
    Request.get<Map<String, dynamic>>(
      RequestApi.relatedPlaylist,
      isShowLoading: false,
      params: params,
      success: (data) {
        if (data['code'] == 200) {
          if (success != null) {
            var result = <PlayListEntity>[];
            data['playlists'].forEach((element) {
              result.add(
                PlayListEntity.fromJson(element),
              );
            });
            success(result);
          }
        } else {
          if (fail != null) {
            fail('获取相关歌单推荐失败');
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
