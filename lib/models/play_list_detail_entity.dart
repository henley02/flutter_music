import 'package:flutter_music/models/creator_entity.dart';

class PlayListDetailEntity {
  late int id;
  late String name;
  late String coverImgUrl;
  late String description;
  late int playCount;
  late int createTime;
  late int updateTime;
  late int trackCount;
  late int subscribedCount;
  late int shareCount;
  late int commentCount;
  List<CreatorEntity>? subscribers;
  late CreatorEntity creator;
  late List<String> tags;

  PlayListDetailEntity({
    required this.id,
    required this.name,
    required this.coverImgUrl,
    required this.description,
    required this.playCount,
    required this.createTime,
    required this.updateTime,
    required this.trackCount,
    required this.subscribedCount,
    required this.shareCount,
    required this.commentCount,
    this.subscribers,
    required this.creator,
    required this.tags,
  });

  PlayListDetailEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coverImgUrl = json['coverImgUrl'];
    description = json['description'];
    playCount = json['playCount'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
    trackCount = json['trackCount'];
    subscribedCount = json['subscribedCount'];
    shareCount = json['shareCount'];
    commentCount = json['commentCount'];
    if (json['subscribers'] != null) {
      subscribers = <CreatorEntity>[];
      json['subscribers'].forEach((v) {
        subscribers?.add(CreatorEntity.fromJson(v));
      });
    }
    creator = CreatorEntity.fromJson(json['creator']);
    tags = <String>[];
    json['tags'].forEach((v) {
      tags.add(v.toString());
    });
  }
}
