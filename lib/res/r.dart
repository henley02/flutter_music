class R {
  static final images = _Images();
  static final fonts = _Fonts();
  static final videos = _Videos();
  static final lottie = _Lottie();
}

class _Images {
  static const path = 'assets/images/';
  final logo = '${path}logo.png';
  final wylogo = '${path}icon_logo.png';

  final appBackground = '${path}app_background.png';

  final bgm = '${path}bgm.png';
  final bet = '${path}bet.png';
  final bfc = '${path}bfc.png';
  final comment = '${path}icon_song_comment.png';
  final download = '${path}icon_song_download.png';
  final more = '${path}icon_song_more.png';
  final disLike = '${path}icon_dislike.png';
  final like = '${path}icon_liked.png';

  final btmBg = '${path}btm_bg.png';
  final btmDiscovery = '${path}btm_discovery.png';
  final btmDiscoveryPrs = '${path}btm_discovery_prs.png';
  final btmEvent = '${path}btm_friend.png';
  final btmEventPrs = '${path}btm_friend_prs.png';
  final btmMine = '${path}btm_mine.png';
  final btmMinePrs = '${path}btm_mine_prs.png';
  final btmVideo = '${path}btm_video.png';
  final btmVideoPrs = '${path}btm_video_prs.png';
  final btmAccount = '${path}btm_account.png';
  final btmAccountPrs = '${path}btm_account_prs.png';

  final iconDaily = '${path}icn_daily.png';
  final iconFm = '${path}icn_fm.png';
  final iconPlaylist = '${path}icn_playlist.png';
  final iconRank = '${path}icn_rank.png';

  final dailyBg = '${path}bg_daily.png';
}

class _Fonts {
  final GuFengLiShu = 'GuFengLiShu';
  final PuHuiTi = 'PuHuiTi';
  final PuHuiTiX = 'PuHuiTiX';
}

class _Videos {
  static const path = 'assets/videos/';
  final loginVideo = '${path}login_video.mp4';
}

class _Lottie {
  static const path = 'assets/lottie/';
  final loading = '${path}loading.json';
  final refreshEmpty = '${path}refresh_empty.json';
  final refreshError = '${path}refresh_error.json';
  final refreshHeader = '${path}refresh_header.json';
  final refreshFooter = '${path}refresh_footer.json';
}
