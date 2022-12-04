import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:podcast_app/models/callback_model.dart';
import 'package:podcast_app/models/topic_model.dart';
import 'package:podcast_app/models/user_model.dart';

class UserProvider with ChangeNotifier, DiagnosticableTreeMixin {
  //region state
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  UserModel _user = UserModel();

  UserModel get user => _user;

  List<TopicModel> _myTopics = [];

  List<TopicModel> get myTopics => _myTopics;

  //end region

  FirebaseFirestore get db => FirebaseFirestore.instance;

  FirebaseAuth get auth => FirebaseAuth.instance;

  //region
  Future<Response> getMyProfile() {
    //TODO : ambil profile user yang sedang login
    return Future.value(Response.Ok(message: ""));
  }

  Future<bool> checkIsLoggedIn() async {
    //TODO :: cek user sudah login atau belum
    _isLoggedIn = true;
    notifyListeners();
    return false;
  }

  Future<Response> signInWithEmailAndPassword(
      String email, String password) async {
    //TODO :: sign with email and password
    try {

      final credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (credential.user == null) {
        return Future.value(Response.Failed(message: 'Login Gagal'));
      }
      final alreadyCompleteProfile = await db
          .collection('USER')
          .doc(credential.user!.uid)
          .withConverter(
              fromFirestore: UserModel.fromFirestore,
              toFirestore: (user, _) => user.toFirestore())
          .get();
      if (!alreadyCompleteProfile.exists) {
        return Future.value(
            Response.OkCompleteProfile(message: 'Login Berhasil'));
      }

      return Future.value(Response.Ok(message: ""));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Future.value(
            Response.Failed(message: 'No User found for that email.'));
      } else if (e.code == 'wrong-password') {
        Response.Failed(message: 'password lu salah cok');
      }
      return Future.value(Response.Failed(message: e.code));
    }
  }

  Future<Response> signInWithGoogle() async {
    //TODO :: sign with google

    return Future.value(Response.Ok(message: ""));
  }

  Future<Response> registerWithEmailAndPassword(
      String email, String password, String name) async {
    //TODO :: sign up
    try {
      final credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      final user = UserModel(name: name);
      final alreadyName = await db
          .collection('USER')
          .doc(credential.user!.uid)
          .set(user.toFirestore());
      return Future.value(
          Response.OkCompleteProfile(message: 'Daftar Berhasil'));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Future.value(
            Response.Failed(message: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        Response.Failed(message: 'The account already exists for that email.');
      }
      return Future.value(Response.Failed(message: e.code));
    }
  }

  Future<Response> uploadProfilePicture(File file, String userUid) {
    return Future.value(Response.Ok(message: ""));
  }

  Future<Response> completeProfile(UserModel arg) {
    //TODO:: complete profile
    return Future.value(Response.Ok(message: ""));
  }

  Future<Response> saveMyTopic(List<TopicModel> topics) {
    return Future.value(Response.Ok(message: ""));
  }

  Future<Response> signOut() async {
    return Future.value(Response.Ok(message: ""));
  }
  //end region
}
