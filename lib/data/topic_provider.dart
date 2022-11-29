import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:podcast_app/models/episode_model.dart';
import 'package:podcast_app/models/topic_model.dart';

import '../models/callback_model.dart';


class TopicProvider with ChangeNotifier,DiagnosticableTreeMixin{
  ///state region
  List<TopicModel> _topics = [];
  List<TopicModel> get topics => _topics;
  ///
  ///region firebase
  FirebaseFirestore get db=>FirebaseFirestore.instance;
  FirebaseAuth get auth =>FirebaseAuth.instance;
  ///


  ///region
  Future<Response> getListTopics(){
    //TODO: ambil data keseluruhan podcast
    return Future.value(Response.Ok(message: ""));
  }
///
}