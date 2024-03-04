class RequestApi {
  static const String BASE_URL = "https://wyapi.vvxing.cn";

  ///邮箱登录
  static const String login = '/login';

  ///手机登录
  static const String phoneLogin = '/login/cellphone';

  ///发送验证码
  static const String sendCode = '/captcha/sent';

  ///验证验证码
  static const String verifyCode = '/captcha/verify';

  ///刷新登录
  static const String refreshLogin = '/login/refresh';

  ///轮播图
  static const String banner = '/banner?type=1';

  ///获取推荐歌单
  static const String recomPlays = '/recommend/resource';

  ///获取推荐新音乐
  static const String newSong = '/personalized/newsong';

  ///获取歌单分类
  static const String playlistCatlist = '/playlist/hot';

  ///获取歌单列表
  static const String playlist = '/top/playlist';

  ///获取歌单详情
  static const String playListDetail = '/playlist/detail';

  ///获取歌单所有歌曲
  static const String playListTrackAll = '/playlist/track/all';

  ///获取相关歌单推荐
  static const String relatedPlaylist = '/related/playlist';

  ///获取歌单收藏者
  static const String playlistSubscribers = '/playlist/subscribers';

  ///获取每日推荐歌曲
  static const String dailySongs = '/recommend/songs';

  ///获取排行榜
  static const String rank = '/toplist/detail';

  ///获取歌曲url
  static const String songUrl = '/song/url';

  ///获取歌曲评论
  static const String songComment = '/comment/music';
}
