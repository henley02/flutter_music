class CreatorEntity {
  late int userId;
  late String nickname;
  late String avatarUrl;
  late String signature;

  CreatorEntity({
    required this.userId,
    required this.nickname,
    required this.avatarUrl,
    required this.signature,
  });

  CreatorEntity.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    nickname = json['nickname'];
    avatarUrl = json['avatarUrl'];
    signature = json['signature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['nickname'] = nickname;
    data['avatarUrl'] = avatarUrl;
    data['signature'] = signature;
    return data;
  }
}
