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

  //end region

  //region firebase
  FirebaseFirestore get db => FirebaseFirestore.instance;

  FirebaseAuth get auth => FirebaseAuth.instance;

  //end region

  //region
  Future<Response> getDetailPodcast(String podcastId) async {
    //TODO : ambil podcast berdasarkan id
    final data = await db
        .collection("PODCAST")
        .doc(podcastId)
        .withConverter(
            fromFirestore: PodcastModel.fromFirestore,
            toFirestore: (dp, _) => dp.toFirestore())
        .get();

    if (data.exists) {
      final finalResult = data.data();
      if (finalResult != null) {
        _detailPodcast = finalResult;
        notifyListeners();
      }
      return Future.value(Response.Ok(message: ""));
      } else {
      return Future.value(Response.Failed(message: ""));
      }
    }

  Future<Response> getListPodcast() {
    //TODO: ambil data keseluruhan podcast
    return Future.value(Response.Ok(message: ""));
  }

  Future<Response> getTrendingPodcast() async {
    //TODO: ambil data  episode berdasarkan likes terbanyak
    return Future.value(Response.Ok(message: ""));
  }

//end region
}
