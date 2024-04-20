import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_music/base/controllers/base_get_controller.dart';
import 'package:flutter_music/models/play_entity.dart';
import 'package:get/get.dart';

class PlayMusicController extends BaseGetController {
  late AudioPlayer _player;
  PlayerState playerState = PlayerState.playing;

  /// 播放列表
  final songs = <PlayEntity>[].obs;

  /// 当前播放的歌曲索引
  final currentIndex = 0.obs;

  ///已播放时长
  Duration played = const Duration();

  ///进度条总长度
  Duration all = const Duration();

  ///是否正在拖动进度条
  bool _isSeeking = false;

  @override
  void onInit() {
    _player = AudioPlayer();
    super.onInit();

    ///播放状态监听已播放进度
    _player.onPositionChanged.listen((event) {
      played = event;
      if (!_isSeeking) {
        update(['time']);
      }
    });

    ///播放状态监听总时长
    _player.onDurationChanged.listen((event) {
      all = event;
      if (!_isSeeking) {
        update(['time']);
      }
    });

    ///播放状态监听
    _player.onPlayerStateChanged.listen((event) {
      playerState = event;

      ///更新播放状态通知ui更新
      update(['animation']);
    });

    ///播放完成监听
    _player.onPlayerComplete.listen((event) {
      ///播放完成
      next();
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  ///播放暂停控制
  void playOrPause() {
    if (playerState == PlayerState.playing) {
      _player.pause();
    } else {
      _player.resume();
    }
  }

  ///单曲播放
  playOne(PlayEntity song) {
    if (songs.isNotEmpty) {
      if (song.id == songs[currentIndex.value].id) {
        return;
      }
      songs.contains(song)
          ? currentIndex.value = songs.indexOf(song)
          : currentIndex.value++;
    }
    songs.insert(currentIndex.value, song);
    play();
  }

  ///下一首播放
  addNext(PlayEntity song) async {
    songs.insert(currentIndex.value + 1, song);
  }

  ///列表播放
  playMore({required List<PlayEntity> songs, int? index}) {
    if (index != null) {
      currentIndex.value = index;
      this.songs.clear();
    }
    this.songs.addAll(songs);
    play();
  }

  ///播放
  play() async {
    requestRepository.getSongUrl(
      id: songs[currentIndex.value].id,
      success: (data) async {
        await _player.play(UrlSource(data));
      },
    );
  }

  ///暂停
  pause() {
    _player.pause();
  }

  ///继续
  resume() {
    _player.resume();
  }

  ///上一首
  previous() {
    _player.stop();

    ///根据播放模式判断
    if (currentIndex.value == 0) {
      currentIndex.value = songs.length - 1;
    } else {
      currentIndex.value--;
    }
    play();
  }

  ///下一首
  next() {
    _player.stop();
    Future.delayed(const Duration(microseconds: 400), () {
      if (currentIndex.value == songs.length - 1) {
        currentIndex.value = 0;
      } else {
        currentIndex.value++;
      }
      play();
    });
  }

  ///开始拖动进度条
  startSeek() {
    _isSeeking = true;
  }

  ///播放跳转
  seeking(double value) {
    _isSeeking = true;
    played = Duration(milliseconds: value.toInt());
    update(['time']);
  }

  ///跳转
  seekTo(double value) {
    _isSeeking = false;
    _player.seek(Duration(milliseconds: value.toInt()));
  }

  delete(index) {
    // todo
  }
}
