import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:podcast_app/models/callback_model.dart';
import 'package:podcast_app/models/topic_model.dart';
import 'package:podcast_app/models/user_model.dart';

class UserProvider with ChangeNotifier, DiagnosticableTreeMixin {
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  UserModel _user= UserModel();
  UserModel get user => _user;

  List<TopicModel> _myTopics = [];
  List<TopicModel> get myTopics => _myTopics;
  List<UserModel> _users =[];
  List<UserModel> get users=>_users;

  FirebaseFirestore get db=>FirebaseFirestore.instance;
  FirebaseAuth get auth =>FirebaseAuth.instance;

  ///region
    Future<Response> getMyProfile(){

      return Future.value(Response.Ok(msg: ""));
    }
  ///endregion

  ///region
    Future<Response> getMyTopics(){
      db.collection("TOPIC")
        .withConverter(fromFirestore: UserModel.fromFirestore, toFirestore: (usr,_)=>UserModel().toFirestore())
        .get()
        .then((value) => {
          value.docs.forEach((element) {
            _users.add(element.data());
            notifyListeners();
        })
      });
      return Future.value(Response.Ok(msg: ""));
    }
  ///end region

  ///region
  Future<bool> checkIsLoggedIn() async {
    //TODO :: cek user sudah login atau belum
    _isLoggedIn = true;
    notifyListeners();
    return false;
  }
  ///end region

  ///region
  Future<Response> signInWithEmailAndPassword(String email, String password) {
    //TODO :: sign with email and password
    return Future.value(Response.Ok(msg: ""));
  }
  ///end region

  ///region
  Future<Response> signInWithGoogle() {
    //TODO :: sign with google
    return Future.value(Response.Ok(msg: ""));
  }
  ///endregion

///region register
  Future<Response> registerWithEmailAndPassword(String email,String password,String name){
    //TODO:: register with email and password
    return Future.value(Response.Ok(msg: ""));
  }
///end region

/// region
  Future<Response> completeProfile(UserModel arg){
    //TODO:: complete profile
    return Future.value(Response.Ok(msg:""));
  }
/// end region

/// region
  Future<Response> saveMyTopic(List<TopicModel> topics){
    return Future.value(Response.Ok(msg: ""));
  }
/// end region
}
