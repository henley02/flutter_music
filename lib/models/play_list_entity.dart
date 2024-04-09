class PlayListEntity {
  late int id;
  late String name;
  late String coverImgUrl;

  PlayListEntity({
    required this.id,
    required this.name,
    required this.coverImgUrl,
  });

  PlayListEntity.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    name = json['name'];
    coverImgUrl = json['coverImgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['coverImgUrl'] = coverImgUrl;
    return data;
  }
}
