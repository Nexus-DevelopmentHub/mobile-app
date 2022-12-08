import 'package:cloud_firestore/cloud_firestore.dart';

class HistorySearchModel {
  String? query = "";
  String? createdAt = "";
  String? id = "";

  HistorySearchModel({this.query, this.createdAt, this.id});

  factory HistorySearchModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return HistorySearchModel(
        query: data?['name'], createdAt: data?['createdAt'], id: data?['id']);
  }

  Map<String, Object?> toFirestore() {
    return {
      if (query != null) "query": query,
      if (createdAt != null) "createdAt": createdAt,
      if (id != null) "id": id
    };
  }
}
