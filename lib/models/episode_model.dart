import 'package:cloud_firestore/cloud_firestore.dart';

class EpisodeModel{
  String? title="";
  String? description="";
  String? thumbnail="";
  String? createdBy="";
  int? durationInSeconds=0;
  String? podcastId="";

  EpisodeModel({
    this.title,
    this.description,
    this.thumbnail,
    this.createdBy,
    this.durationInSeconds,
    this.podcastId,
  });


  factory EpisodeModel.fromFirestore(
      DocumentSnapshot<Map<String,dynamic>> snapshot,
      SnapshotOptions? options
      ){
    final data = snapshot.data();
    return EpisodeModel(
        title: data?['title'],
        description: data?['description'],
        thumbnail: data?['thumbnail'],
        createdBy: data?['createdBy'],
        durationInSeconds: data?['durationInSeconds'],
        podcastId: data?['podcastId']
    );

  }

  Map<String,Object?> toFirestore(){
    return {
      if(title != null) "title":title,
      if(description != null) "description":description,
      if(thumbnail != null) "thumbnail":thumbnail,
      if(createdBy != null) "createdBy":createdBy,
      if(durationInSeconds != null) "durationInSeconds":durationInSeconds,
      if(podcastId != null) "podcastId":podcastId
    };
  }
}