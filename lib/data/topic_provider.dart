import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:podcast_app/models/callback_model.dart';
import 'package:podcast_app/models/topic_model.dart';

class TopicProvider with ChangeNotifier, DiagnosticableTreeMixin {
  //state region
  List<TopicModel> _topics = [];

  List<TopicModel> get topics => _topics;

  //end region

  //region firebase
  FirebaseFirestore get db => FirebaseFirestore.instance;

  FirebaseAuth get auth => FirebaseAuth.instance;

  //end region

  //region
  Future<Response> createTopics() {
    //TODO::
    return Future.value(Response.Ok(message: ""));
  }

  //ambil data keseluruhan podcast
  Future<Response> getListTopics() async {
    final data = await db
        .collection("")
        .withConverter(
            fromFirestore: TopicModel.fromFirestore,
            toFirestore: (listTopics, _) => listTopics.toFirestore())
        .get();

    final topicResult = data.docs.map((listTopics) => listTopics.data());
    _topics.addAll(topicResult);
    notifyListeners();

    return Future.value(Response.Ok(message: ""));
  }
//end region
}
