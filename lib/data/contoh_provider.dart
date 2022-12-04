import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:podcast_app/models/callback_model.dart';
import 'package:podcast_app/models/episode_model.dart';
import 'package:podcast_app/models/podcast_model.dart';
import 'package:podcast_app/models/topic_model.dart';
import 'package:podcast_app/models/user_model.dart';

class ContohProvider with ChangeNotifier, DiagnosticableTreeMixin {
  //region state
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  UserModel _user = UserModel();

  UserModel get user => _user;

  TopicModel _detailTopic = TopicModel();

  TopicModel get detailTopic => _detailTopic;

  List<TopicModel> _myTopics = [];

  List<TopicModel> get myTopics => _myTopics;

  List<PodcastModel> _podcast = [];

  List<PodcastModel> get podcast => _podcast;

  //end region

  FirebaseFirestore get db => FirebaseFirestore.instance;

  FirebaseAuth get auth => FirebaseAuth.instance;

  //region

  //ambil data kesulurahan
  Future<Response> getDataList() async {
    var data = await db
        .collection("") // nama collectionnya
        .withConverter(
            fromFirestore: TopicModel.fromFirestore,
            toFirestore: (topic, _) => topic.toFirestore())
        .get();

    _myTopics.addAll(data.docs.map((e) => e.data()));
    notifyListeners();

    return Response.Ok(message: "");
  }

  Future<Response> getDataListPodcast() async {

    final data = await db.collection("PODCAST")
    .doc("42356748")
    .collection("EPISODE")
    .doc("esanska")
    .withConverter(
        fromFirestore: EpisodeModel.fromFirestore,
        toFirestore: (eps,_)=>eps.toFirestore())
    .get();

    if(data.exists) {
      final convert = data.data();
    }

    return Response.Ok(message: "");
  }



  //ambil salah satu data
  Future<Response> getDetail() async {
    var data = await db
        .collection("") // nama collectionnya
        .doc("") // id data yang mai diambil detailnya
        .withConverter(
            fromFirestore: TopicModel.fromFirestore,
            toFirestore: (topic, _) => topic.toFirestore())
        .get();
    var result = data.data();

    if (result != null) {
      _detailTopic = result;
      return Response.Ok(message: "");
    } else {
      return Response.Failed(message: "");
    }
  }

  //simpan data
  Future<Response> saveData(TopicModel model) async {
    await db.collection("").doc().set(model.toFirestore());

    return Response.Ok(message: "");
  }

  //update data
  Future<Response> updateData(TopicModel model) async {
    await db.collection("").doc().set(model.toFirestore(),SetOptions(
      merge: true
    ));

    return Response.Ok(message: "");
  }
//end region

  Future<Response> autentikas(String email,String password) async {
    try{
      var result = await auth.signInWithEmailAndPassword(email: email, password: password);

    }on FirebaseAuthException catch(e){
      if(e.message == ""){

      }
    }

    return Response.Ok(message: "");
  }
}
