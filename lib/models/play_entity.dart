class PlayEntity {
  late int id;
  late String name;
  late String cover;
  late String singer;

  PlayEntity({
    required this.id,
    required this.name,
    required this.cover,
    required this.singer,
  });

  PlayEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cover = json['cover'];
    singer = json['singer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['cover'] = cover;
    data['singer'] = singer;
    return data;
  }

  @override
  String toString() {
    return 'PlayEntity{id: $id, name: $name, cover: $cover, singer: $singer}';
  }
}
