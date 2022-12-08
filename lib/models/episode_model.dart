import 'package:cloud_firestore/cloud_firestore.dart';

class EpisodeModel {
  String? id = "";
  String? title = "";
  String? description = "";
  String? thumbnail = "";
  String? createdBy = "";
  int? durationInSeconds = 0;
  int? likes = 0;
  String? audioUrl = "";
  String? podcastId = "";
  int? createdAt = 0;
  int? updatedAt = 0;

  EpisodeModel(
      {this.id,
      this.title,
      this.description,
      this.thumbnail,
      this.createdBy,
      this.durationInSeconds,
      this.likes,
      this.audioUrl,
      this.podcastId,
      this.createdAt,
      this.updatedAt});

  factory EpisodeModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return EpisodeModel(
        id: data?['id'],
        title: data?['title'],
        description: data?['description'],
        thumbnail: data?['thumbnail'],
        createdBy: data?['createdBy'],
        durationInSeconds: data?['durationInSeconds'],
        audioUrl: data?['audioUrl'],
        likes: data?['likes'],
        podcastId: data?['podcastId'],
        createdAt: data?['createdAt'],
        updatedAt: data?['updatedAt']);
  }

  Map<String, Object?> toFirestore() {
    return {
      if (id != null) "id": id,
      if (title != null) "title": title,
      if (description != null) "description": description,
      if (thumbnail != null) "thumbnail": thumbnail,
      if (createdBy != null) "createdBy": createdBy,
      if (durationInSeconds != null) "durationInSeconds": durationInSeconds,
      if(likes != null) "likes":likes,
      if (audioUrl != null) "audioUrl":audioUrl,
      if (podcastId != null) "podcastId": podcastId,
      if (createdAt != null) "createdAt": createdAt,
      if (updatedAt != null) "updated": updatedAt
    };
  }
}
