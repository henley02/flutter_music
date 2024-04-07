class RecommendPlayEntity {
  late int id;
  late String name;
  late String picUrl;
  late int playCount;

  RecommendPlayEntity({
    required this.id,
    required this.name,
    required this.picUrl,
    required this.playCount,
  });

  RecommendPlayEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    picUrl = json['picUrl'];
    playCount = json['playCount'];
  }
}
