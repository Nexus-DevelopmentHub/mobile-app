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

  List<EpisodeModel> _topEpisodes = [];

  List<EpisodeModel> get topEpisodes => _topEpisodes;

  //end region

  //region firebase
  FirebaseFirestore get db => FirebaseFirestore.instance;

  FirebaseAuth get auth => FirebaseAuth.instance;

  //end region

  //region
  Future<Response> getDetailEpisode(String episodeId) async {
    //TODO : ambil episode berdasarkan id
    final data = await db
        .collection("EPISODE")
        .doc(episodeId)
        .withConverter(
            fromFirestore: EpisodeModel.fromFirestore,
            toFirestore: (e, _) => e.toFirestore())
        .get();

    if (data.exists) {
      final finalResult = data.data();
      if (finalResult != null) {
        _detailEpisode = finalResult;
        notifyListeners();
      }
      return Future.value(Response.Ok(message: "Berhasil"));
    } else {
      return Future.value(Response.Failed(message: "Gagal"));
    }
  }

  Future<Response> getListEpisodeByPodcast(String podcastId) {
    //TODO: ambil data  episode berdasarkan podcast
    return Future.value(Response.Ok(message: ""));
  }

  Future<Response> getTopEpisodes() async {
    //TODO: ambil data  episode berdasarkan likes terbanyak
    return Future.value(Response.Ok(message: ""));
  }
//end region
}
