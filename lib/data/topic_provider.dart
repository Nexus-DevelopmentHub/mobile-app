import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:podcast_app/models/callback_model.dart';
import 'package:podcast_app/models/podcast_model.dart';
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
  Future<Response> getListTopics(String listTopics) async {
    final data = await db
        .collection("")
        .doc(listTopics)
        .withConverter(
            fromFirestore: TopicModel.fromFirestore,
            toFirestore: (tl, _) => tl.toFirestore())
        .get();

    if (data.exists) {
      final topicResult = data.data();
      if (topicResult != null) {
        _topics = topicResult as List<TopicModel>;
        notifyListeners();
      }
      return Future.value(Response.Ok(message: "Berhasil"));
    } else {
      return Future.value(Response.Failed(message: "Gagal"));
    }
  }
//end region
}
