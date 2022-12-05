import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:podcast_app/models/callback_model.dart';
import 'package:podcast_app/models/topic_model.dart';
import 'package:podcast_app/models/user_model.dart';

class UserProvider with ChangeNotifier, DiagnosticableTreeMixin {
  //region state
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  String _completeProfilePictureUrl = "";

  String get completeProfilePictureUrl => _completeProfilePictureUrl;

  UserModel _user = UserModel();

  UserModel get user => _user;

  List<TopicModel> _myTopics = [];

  List<TopicModel> get myTopics => _myTopics;

  //end region

  FirebaseFirestore db = FirebaseFirestore.instance;

  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseStorage storage = FirebaseStorage.instance;

  //region
  Future<Response> signOut() async {
    try {
      final credential = await auth.signOut();
      return Future.value(Response.Ok(message: ""));
    } on FirebaseAuthException catch (e) {
      return Response.Failed(message: e.code);
    }
  }

  Future<Response> getMyProfile() {
    //TODO : ambil profile user yang sedang login
    return Future.value(Response.Ok(message: ""));
  }

  //https://stackoverflow.com/questions/65221515/flutter-firebase-logged-in-user-returns-a-null-currentuser-after-sign-in
  Future<bool> checkIsLoggedIn() async {
    auth.authStateChanges().listen((event) {
      _isLoggedIn = event != null;
      notifyListeners();
    });
    return _isLoggedIn;
  }

  Future<Response> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      //sign in with email and password
      final credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      //if user empty sign in should be failed
      if (credential.user == null) {
        return Future.value(Response.Failed(message: 'Login Gagal'));
      }

      //check if profile already exist
      final alreadyCompleteProfile = await db
          .collection('USER')
          .doc(credential.user!.uid)
          .withConverter(
              fromFirestore: UserModel.fromFirestore,
              toFirestore: (user, _) => user.toFirestore())
          .get();
      //tell app that user neet complete profile after loggedin
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
      await db
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

  Future<Response> uploadProfilePicture(File file) async {
    //get userUid for name image ex: userUid.jpg
    var currentUser = auth.currentUser;
    if (currentUser == null) {
      auth.authStateChanges().listen((event) {
        currentUser = event;
      });
    }

    final userId =
        currentUser?.uid ?? DateTime.now().microsecondsSinceEpoch.toString();
    //create folder and location file
    final profileRef = storage.ref().child("USER_PROFILE").child("$userId.jpg");

    try {
      //start uplaoding
      await profileRef.putFile(file);

      //save upload url temporary
      _completeProfilePictureUrl = await profileRef.getDownloadURL();
      notifyListeners();

      return Response.Ok(message: "Gambar profile berhasil di upload");
    } on FirebaseException catch (e) {
      return Response.Failed(message: e.message.toString());
    }

    return Future.value(Response.Ok(message: ""));
  }
}

Future<Response> completeProfile(UserModel arg) {
  //TODO:: complete profile
  return Future.value(Response.Ok(message: ""));
}

Future<Response> saveMyTopic(List<TopicModel> topics) {
  return Future.value(Response.Ok(message: ""));
}


//end region

