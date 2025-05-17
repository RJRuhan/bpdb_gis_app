// class Pole {
//   final int poleDetailsId;
//   final String poleCode;
//   final int feederLineId;
//   final int poleId;
//   final String poleUniqueCode;

//   Pole({
//     required this.poleDetailsId,
//     required this.poleCode,
//     required this.feederLineId,
//     required this.poleId,
//     required this.poleUniqueCode,
//   });

//   factory Pole.fromJson(Map<String, dynamic> json) {
//     return Pole(
//       poleDetailsId: json['poleDetailsId'],
//       poleCode: json['poleCode'],
//       feederLineId: json['feederLineId'],
//       poleId: json['poleId'],
//       poleUniqueCode: json['poleUniqueCode'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'poleDetailsId': poleDetailsId,
//       'poleCode': poleCode,
//       'feederLineId': feederLineId,
//       'poleId': poleId,
//       'poleUniqueCode': poleUniqueCode,
//     };
//   }
// }

class Pole {
  final int poleDetailsId;
  final String poleCode;
  final int? feederLineId;
  final int poleId;
  final String? poleUniqueCode;

  Pole({
    required this.poleDetailsId,
    required this.poleCode,
    this.feederLineId,
    required this.poleId,
    this.poleUniqueCode,
  });

  factory Pole.fromJson(Map<String, dynamic> json) {
    return Pole(
      poleDetailsId: json['poleDetailsId'] ?? 0, // default value if null
      poleCode: json['poleCode'] ?? '', // default value if null
      feederLineId: json['feederLineId'] ?? 0, // default value if null
      poleId: json['poleId'] ?? 0, // default value if null
      poleUniqueCode: json['poleUniqueCode'] ?? '', // default value if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'poleDetailsId': poleDetailsId ?? 0, // ensure non-null value
      'poleCode': poleCode ?? '',
      'feederLineId': feederLineId ?? 0,
      'poleId': poleId ?? 0,
      'poleUniqueCode': poleUniqueCode ?? '',
    };
  }
}

