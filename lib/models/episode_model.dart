import 'package:cloud_firestore/cloud_firestore.dart';

class EpisodeModel {
  String? id = "";
  String? title = "";
  String? description = "";
  String? thumbnail = "";
  String? createdBy = "";
  int? durationInSeconds = 0;
  String? podcastId = "";
  String? audioUrl = "";
  int? createdAt = 0;
  int? updatedAt = 0;

  EpisodeModel(
      {this.id,
      this.title,
      this.description,
      this.thumbnail,
      this.createdBy,
      this.durationInSeconds,
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
      if (podcastId != null) "podcastId": podcastId,
      if (createdAt != null) "createdAt": createdAt,
      if (updatedAt != null) "updated": updatedAt
    };
  }
}
