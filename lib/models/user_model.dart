import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String? name="";
  String? email="";
  String? photoProfile="";
  String? dateOfBirth="";
  String? gender="";
  String? address="";

  UserModel({
    this.name,
    this.address,
    this.email,
    this.photoProfile,
    this.dateOfBirth,
    this.gender,
});

  bool isMale(){
    return gender == "laki-laki" || gender == "l";
  }

  factory UserModel.fromFirestore(
      DocumentSnapshot<Map<String,dynamic>> snapshot,
      SnapshotOptions? options
      ){
    final data = snapshot.data();
    return UserModel(
      name: data?['name'],
      email: data?['email'],
      photoProfile: data?['photoProfile'],
      dateOfBirth: data?['dateOfBirth'],
      gender: data?['gender'],
      address: data?['address']
    );

  }

  Map<String,Object?> toFirestore(){
    return {
      if(name != null) "name":name,
      if(email != null) "email":email,
      if(photoProfile != null) "photoProfile":photoProfile,
      if(dateOfBirth != null) "dateOfBirth":dateOfBirth,
      if(gender != null) "gender":gender,
      if(address != null) "address":address
    };
  }
}