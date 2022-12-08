import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String? name="";
  String? email="";
  String? photoProfile="";
  String? dateOfBirth="";
  bool? isActive=true;
  String? gender="";
  String? address="";
  String? level="";
  int? updatedAt=0;
  int? createdAt=0;

  UserModel({
    this.name,
    this.email,
    this.photoProfile,
    this.dateOfBirth,
    this.isActive,
    this.gender,
    this.address,
    this.level,
    this.updatedAt,
    this.createdAt
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
      isActive:data?["isActive"],
      gender: data?['gender'],
      address: data?['address'],
      level:data?['level'],
      updatedAt: data?['updatedAt'],
      createdAt: data?['createdAt']
    );

  }

  Map<String,Object?> toFirestore(){
    return {
      if(name != null) "name":name,
      if(email != null) "email":email,
      if(photoProfile != null) "photoProfile":photoProfile,
      if(dateOfBirth != null) "dateOfBirth":dateOfBirth,
      if(isActive != null) "isActive":isActive,
      if(gender != null) "gender":gender,
      if(address != null) "address":address,
      if(level != null) "level":level,
      if(updatedAt != null) "updatedAt":updatedAt,
      if(createdAt != null) "createdAt":createdAt
    };
  }
}