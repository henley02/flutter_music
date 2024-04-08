class PlayListDetailSongEntity {
  late int id;
  late String name;
  late String singer;
  late String picUrl;
  late String description;

  PlayListDetailSongEntity({
    required this.id,
    required this.name,
    required this.singer,
    required this.picUrl,
    required this.description,
  });

  PlayListDetailSongEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    var sins = <String>[];
    json['ar'].forEach((v) {
      sins.add(v['name']);
    });
    singer = sins.join('/');
    picUrl = json['al']['picUrl'];
    description = json['al']['name'];
  }
}
