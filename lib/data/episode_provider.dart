import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:podcast_app/models/callback_model.dart';
import 'package:podcast_app/models/episode_model.dart';

class EpisodeProvider with ChangeNotifier, DiagnosticableTreeMixin {
  //state region
  EpisodeModel _detailEpisode = EpisodeModel();

  EpisodeModel get detailEpisode => _detailEpisode;

  List<EpisodeModel> _episodes = [];

  List<EpisodeModel> get episodes => _episodes;

  //end region

  //region firebase
  FirebaseFirestore get db => FirebaseFirestore.instance;

  FirebaseAuth get auth => FirebaseAuth.instance;

  //end region

  //region
  Future<Response> getDetailEpisode(String podcastId) {
    //TODO : ambil podcast berdasarkan id
    return Future.value(Response.Ok(message: ""));
  }

  //end region

  //region
  Future<Response> getListEpisode() {
    //TODO: ambil data keseluruhan podcast
    return Future.value(Response.Ok(message: ""));
  }
//
}
