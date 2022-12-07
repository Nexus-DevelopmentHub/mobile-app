import 'package:cloud_firestore/cloud_firestore.dart';

class PodcastModel {
  String? id = "";
  String? title = "";
  String? description = "";
  String? thumbnail = "";
  int? likes = 0;
  int? createdAt = 0;
  String? createdBy = "";
  int? updatedAt = 0;

  PodcastModel(
      {this.id,
      this.title,
      this.description,
      this.thumbnail,
      this.likes,
      this.createdAt,
      this.createdBy,
      this.updatedAt});

  factory PodcastModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return PodcastModel(
      id: data?['id'],
      title: data?['title'],
      description: data?['description'],
      thumbnail: data?['thumbnail'],
      likes: data?['likes'],
      createdAt: data?['createdAt'],
      createdBy: data?['createdBy'],
      updatedAt: data?['updatedAt']
    );
  }

  Map<String, Object?> toFirestore() {
    return {
      if (id != null) "id": id,
      if (title != null) "title": title,
      if (description != null) "description": description,
      if (thumbnail != null) "thumbnail": thumbnail,
      if (likes != null) "likes": likes,
      if (createdAt != null) "createdAt": createdAt,
      if (createdBy != null) "createdBy": createdBy,
      if(updatedAt != null) "updatedAt":updatedAt

    };
  }
}
