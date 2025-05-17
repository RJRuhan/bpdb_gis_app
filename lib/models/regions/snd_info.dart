// class SndInfo {
//   final int sndId;
//   final int circleId;
//   final String sndCode;
//   final String sndName;

//   SndInfo({
//     required this.sndId,
//     required this.circleId,
//     required this.sndCode,
//     required this.sndName,
//   });

//   factory SndInfo.fromJson(Map<String, dynamic> json) {
//     return SndInfo(
//       sndId: json['sndId'],
//       circleId: json['circleId'],
//       sndCode: json['sndCode'],
//       sndName: json['snDName'],
//     );
//   }
// }

class SndInfo {
  final int sndId;
  final int circleId;
  final String sndCode;
  final String sndName;

  SndInfo({
    required this.sndId,
    required this.circleId,
    required this.sndCode,
    required this.sndName,
  });

  factory SndInfo.fromJson(Map<String, dynamic> json) {
    return SndInfo(
      sndId: json['sndId'] ?? 0, // Default to 0 if null
      circleId: json['circleId'] ?? 0, // Default to 0 if null
      sndCode: json['sndCode'] ?? '', // Default to empty string if null
      sndName: json['snDName'] ?? '', // Default to empty string if null
    );
  }
}

