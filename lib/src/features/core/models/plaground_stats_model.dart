import 'package:cloud_firestore/cloud_firestore.dart';

class PlaygroundStatsModel {
  final String? id;
  final String? email; // ID of the user this plan belongs to
  final String inverterId;
  final String panelId;
  final String noOfPanels;

  const PlaygroundStatsModel({
    this.id,
    required this.email,
    required this.inverterId,
    required this.panelId,
    required this.noOfPanels,
  });

  // Map data to JSON approach for Firebase
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'inverterId': inverterId,
      'panelId': panelId,
      'noOfPanels': noOfPanels,
    };
  }

  // Convert document snapshot to MyPlanModel
  factory PlaygroundStatsModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return PlaygroundStatsModel(
      id: document.id,
      email: data['email'],
      inverterId: data['inverterId'],
      panelId: data['panelId'],
      noOfPanels: data['noOfPanels'],
    );
  }
}
