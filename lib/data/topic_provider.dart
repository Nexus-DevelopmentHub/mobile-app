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
  Future<Response> createTopics(){
    //TODO::
    return Future.value(Response.Ok(message: ""));
  }

  Future<Response> getListTopics() {
    //TODO: ambil data keseluruhan podcast
    return Future.value(Response.Ok(message: ""));
  }
//end region
}
