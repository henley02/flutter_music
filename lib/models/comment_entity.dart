class CommentEntity {
  late int total;
  late bool moreHot;
  late List<Comment> hotComments;
  late List<Comment> comments;

  CommentEntity({
    required this.total,
    required this.moreHot,
    required this.hotComments,
    required this.comments,
  });

  CommentEntity.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    moreHot = json['moreHot'];
    if (json['hotComments'] != null) {
      hotComments = <Comment>[];
      json['hotComments'].forEach((v) {
        hotComments.add(Comment.fromJson(v));
      });
    }
    if (json['comments'] != null) {
      comments = <Comment>[];
      json['comments'].forEach((v) {
        comments.add(Comment.fromJson(v));
      });
    }
  }
}

class Comment {
  late CommentUser user;
  late String content;
  late int time;
  late String timeStr;
  late int likedCount;
  late bool liked;

  Comment({
    required this.user,
    required this.content,
    required this.time,
    required this.timeStr,
    required this.likedCount,
    required this.liked,
  });

  Comment.fromJson(Map<String, dynamic> json) {
    user = (json['user'] != null ? CommentUser.fromJson(json['user']) : null)!;
    content = json['content'];
    time = json['time'];
    timeStr = json['timeStr'];
    likedCount = json['likedCount'];
    liked = json['liked'];
  }
}

class CommentUser {
  late int userId;
  late String nickname;
  late String avatarUrl;
  String? iconUrl;

  CommentUser({
    required this.userId,
    required this.nickname,
    required this.avatarUrl,
    this.iconUrl,
  });

  CommentUser.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    nickname = json['nickname'];
    if (json['vipRights'] != null && json['vipRights']['associator'] != null) {
      iconUrl = json['vipRights']['associator']['iconUrl'];
    }
  }
}
