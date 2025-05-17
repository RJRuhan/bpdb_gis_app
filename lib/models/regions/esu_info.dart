class EsuInfo {
  final int esuId;
  final int sndId;
  final String esuCode;
  final String esuName;

  EsuInfo({
    required this.esuId,
    required this.sndId,
    required this.esuCode,
    required this.esuName,
  });

  factory EsuInfo.fromJson(Map<String, dynamic> json) {
    return EsuInfo(
      esuId: json['esuId'],
      sndId: json['sndId'],
      esuCode: json['esuCode'],
      esuName: json['esuName'],
    );
  }
  // Method to convert an instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'esuId': esuId,
      'sndId': sndId,
      'esuCode': esuCode,
      'esuName': esuName,
    };
  }
}