import 'package:cloud_firestore/cloud_firestore.dart';

class PodcastModel {
  String? title = "";
  String? description = "";
  String? thumbnail = "";
  int? likes = 0;
  int? createdAt = 0;
  String? createdBy = "";
  String? id = "";

  PodcastModel(
      {this.title,
      this.description,
      this.thumbnail,
      this.likes,
      this.createdAt,
      this.createdBy,
      this.id});

  factory PodcastModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return PodcastModel(
        title: data?['title'],
        description: data?['description'],
        thumbnail: data?['thumbnail'],
        likes: data?['likes'],
        createdBy: data?['createdBy'],
        createdAt: data?['createdAt'],
        id: data?['id']);
  }

  Map<String, Object?> toFirestore() {
    return {
      if (title != null) "title": title,
      if (description != null) "description": description,
      if (thumbnail != null) "thumbnail": thumbnail,
      if (likes != null) "likes": likes,
      if (createdBy != null) "createdBy": createdBy,
      if (createdAt != null) "createdAt": createdAt,
      if (id != null) "id": id
    };
  }
}
