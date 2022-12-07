import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:podcast_app/models/callback_model.dart';
import 'package:podcast_app/models/podcast_model.dart';

class PodcastProvider with ChangeNotifier, DiagnosticableTreeMixin {
  //state region
  PodcastModel _detailPodcast = PodcastModel();

  PodcastModel get detailPodcast => _detailPodcast;

  List<PodcastModel> _podcasts = [];

  List<PodcastModel> get podcasts => _podcasts;

  List<PodcastModel> _searchPodcast = [];

  List<PodcastModel> get SearchPodcast => _searchPodcast;

  List<PodcastModel> _trendingPodcast = [];

  List<PodcastModel> get TrendingPodcast => _searchPodcast;


  //end region

  //region firebase
  FirebaseFirestore get db => FirebaseFirestore.instance;

  FirebaseAuth get auth => FirebaseAuth.instance;

  //end region

  //region
  Future<Response> getDetailPodcast(String podcastId) async {
    //get data podcast by id
    final data = await db
        .collection("PODCAST")
        .doc(podcastId)
        .withConverter(
            fromFirestore: PodcastModel.fromFirestore,
            toFirestore: (dp, _) => dp.toFirestore())
        .get();

    //check if the data has found
    if (data.exists) {
      //get actual data
      final finalResult = data.data();
      //make sure the data is not null
      if (finalResult != null) {
        //assign data to state and notify subscriber
        _detailPodcast = finalResult;
        notifyListeners();
      }
      return Future.value(Response.Ok(message: ""));
    } else {
      return Future.value(Response.Failed(message: ""));
    }
  }

  Future<Response> getListPodcast() async {
    
    final data = await db
        .collection("PODCAST")
        .where("id", isEqualTo: podcasts)
        .withConverter(
            fromFirestore: PodcastModel.fromFirestore,
            toFirestore: (listPodcast, _) => listPodcast.toFirestore())
        .get();

    //convert in array [EpisodeModel]
    final convertData = data.docs.map((listPodcast) => listPodcast.data());

    //notify apps the data has changed
    _podcasts.addAll(convertData);
    notifyListeners();

    //always return success
    return Future.value(Response.Ok(message: ""));
  }

  Future<Response> getTrendingPodcast() async {
    //TODO: ambil data  episode berdasarkan likes terbanyak
            final data = await db
        .collection("PODCAST")
        .orderBy("likes", descending: true).limit(5)
        .withConverter(
            fromFirestore: PodcastModel.fromFirestore,
            toFirestore: (podcast, _) => podcast.toFirestore())
        .get();

    final convertData = data.docs.map((podcast) => podcast.data());

    //notify apps the data has changed
    _trendingPodcast.addAll(convertData);
    notifyListeners();
    return Future.value(Response.Ok(message: ""));
  }

  Future<Response> searchPodcast(String keyword) async {
    //get data by title with keyword is exist
    final data = await db
        .collection("PODCAST")
        .where("title", isEqualTo: keyword)
        .withConverter(
            fromFirestore: PodcastModel.fromFirestore,
            toFirestore: (podcast, _) => podcast.toFirestore())
        .get();

    //convert in array [PodcastModel]
    final convertData = data.docs.map((podcast) => podcast.data());

    //notify apps the data has changed
    _searchPodcast.addAll(convertData);
    notifyListeners();

    //always return success
    return Future.value(Response.Ok(message: ""));
  }

//end region
}
