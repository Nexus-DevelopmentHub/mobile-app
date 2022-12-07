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

  List<EpisodeModel> get episodes => _listEpisodes;

  List<EpisodeModel> _listEpisodes = [];

  List<EpisodeModel> get listEpisodes => _listEpisodes;

  List<EpisodeModel> _topEpisodes = [];

  List<EpisodeModel> get topEpisodes => _topEpisodes;

  //end region

  //region firebase
  FirebaseFirestore get db => FirebaseFirestore.instance;

  FirebaseAuth get auth => FirebaseAuth.instance;

  //end region

  //region
  Future<Response> getDetailEpisode(String episodeId) async {
    //get data from firestore
    final data = await db
        .collection("EPISODE")
        .doc(episodeId)
        .withConverter(
            fromFirestore: EpisodeModel.fromFirestore,
            toFirestore: (e, _) => e.toFirestore())
        .get();

    //check if data has found
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

  Future<Response> getListEpisodeByPodcast(String podcastId) async {
    final data = await db
        .collection("EPISODE")
        .where("podcastId", isEqualTo: podcastId)
        .withConverter(
            fromFirestore: EpisodeModel.fromFirestore,
            toFirestore: (listEpisode, _) => listEpisode.toFirestore())
        .get();

    //convert in array [EpisodeModel]..
    final convertData = data.docs.map((listEpisode) => listEpisode.data());

    //notify apps the data has changed
    _listEpisodes.addAll(convertData);
    notifyListeners();

    //always return success
    return Future.value(Response.Ok(message: ""));
  }

  Future<Response> getTopEpisodes() async {
    //TODO: ambil data  episode berdasarkan likes terbanyak
    final data = await db
        .collection("EPISODE")
        .orderBy("likes", descending: true)
        .limit(5)
        .withConverter(
            fromFirestore: EpisodeModel.fromFirestore,
            toFirestore: (episode, _) => episode.toFirestore())
        .get();

    final convertData = data.docs.map((episode) => episode.data());

    //notify apps the data has changed
    _topEpisodes.addAll(convertData);
    notifyListeners();

    return Future.value(Response.Ok(message: ""));
  }
//end region
}
