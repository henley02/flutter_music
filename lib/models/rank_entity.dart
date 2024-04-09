///排行榜实体

class RankEntity {
  late int id;
  late String name;
  late String coverImgUrl;
  String? description;
  late String updateFrequency;
  late List<Track> tracks;

  RankEntity({
    required this.id,
    required this.name,
    required this.coverImgUrl,
    required this.description,
    required this.updateFrequency,
    required this.tracks,
  });

  RankEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coverImgUrl = json['coverImgUrl'];
    description = json['description'];
    updateFrequency = json['updateFrequency'];
    tracks = <Track>[];
    if (json['tracks'] is List && json['tracks'].isNotEmpty) {
      json['tracks'].forEach((v) {
        tracks.add(Track.fromJson(v));
      });
    }
  }
}

class Track {
  late String name;
  late String singer;

  Track({
    required this.name,
    required this.singer,
  });

  Track.fromJson(Map<String, dynamic> json) {
    name = json['first'];
    singer = json['second'];
  }
}
