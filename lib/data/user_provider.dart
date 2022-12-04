import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:podcast_app/models/callback_model.dart';
import 'package:podcast_app/models/topic_model.dart';
import 'package:podcast_app/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
      final Credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

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
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final UserCredential = await GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final result =
          await FirebaseAuth.instance.signInWithCredential(UserCredential);
      return Future.value(Response.Ok(message: 'Berhasil Login'));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        return Future.value(Response.Failed(
            message:
                'The account already exists with a different credential.'));
      } else if (e.code == 'invalid-credential') {
        return Future.value(Response.Failed(
            message: 'Error occurred while accessing credentials. Try again.'));
      }
      return Future.value(Response.Failed(message: e.code));
    }
  }

  Future<Response> registerWithEmailAndPassword(
      String email, String password, String name) {
    //TODO:: register with email and password
    return Future.value(Response.Ok(message: ""));
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
