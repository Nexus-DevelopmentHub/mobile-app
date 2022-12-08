import 'package:cloud_firestore/cloud_firestore.dart';

class TopicModel{
  String? name;
  String? key;
  String? image;
  String? color;

  TopicModel({
    this.name,
    this.key,
    this.image,
    this.color
  });

  factory TopicModel.fromFirestore(
      DocumentSnapshot<Map<String,dynamic>> snapshot,
      SnapshotOptions? options
      ){
    final data = snapshot.data();
    return TopicModel(
      name: data?['name'],
      key: data?['key'].toString(),
      image: data?['image'],
      color: data?['color']
    );
  }
  Map<String,dynamic> toFirestore(){
    return{
      if(name != null) "name":name,
      if(key != null) "key":key,
      if(image != null) "image":image,
      if(color != null) "color":color
    };
  }
}