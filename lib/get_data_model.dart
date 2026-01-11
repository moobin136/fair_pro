class GetDataModel {
  final String matchID;
  final String teamOne;
  final String teamTow;
  final double teamOneScore;
  final double teamTowScore;
  final bool isMatchRunning;

  GetDataModel({
    required this.matchID,
    required this.teamOne,
    required this.teamTow,
    required this.teamOneScore,
    required this.teamTowScore,
    required this.isMatchRunning,
  });

  factory GetDataModel.fromJson(String docId, Map<String, dynamic> json) {
    return GetDataModel(
      matchID: docId,
      teamOne: json['teamOne'] as String? ?? 'N/A',
      teamTow: json['teamTow'] as String? ?? 'N/A',
      teamOneScore: (json['teamOneScore'] as num?)?.toDouble() ?? 0.0,
      teamTowScore: (json['teamTowScore'] as num?)?.toDouble() ?? 0.0,
      isMatchRunning: json['isMatchRunning'] as bool? ?? false,
    );
  }
}