class NewSongEntity {
  late int id;
  late String name;
  late String picUrl;
  late String artistName;

  NewSongEntity({
    required this.id,
    required this.name,
    required this.picUrl,
    required this.artistName,
  });

  NewSongEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    picUrl = json['picUrl'];
    var result = <String>[];
    json['song']['artists'].forEach((item) {
      result.add(item['name']);
    });
    artistName = result.join('/');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['picUrl'] = picUrl;
    data['artistName'] = artistName;
    return data;
  }
}
