// class FeederLine {
//   final int feederLineId;
//   final int sourceSubstationId;
//   final int? destinationSubstationId;
//   final String feederLineCode;
//   final String feederlineName;

//   FeederLine({
//     required this.feederLineId,
//     required this.sourceSubstationId,
//     this.destinationSubstationId,
//     required this.feederLineCode,
//     required this.feederlineName,
//   });

//   factory FeederLine.fromJson(Map<String, dynamic> json) {
//     return FeederLine(
//       feederLineId: json['feederLineId'],
//       sourceSubstationId: json['sourceSubstationId'],
//       destinationSubstationId: json['destinationSubstationId'],
//       feederLineCode: json['feederLineCode'],
//       feederlineName: json['feederlineName'],
//     );
//   }
// }

class FeederLine {
  final int? feederLineId;
  final int? sourceSubstationId;
  final int? destinationSubstationId;
  final String? feederLineCode;
  final String? feederlineName;

  FeederLine({
    this.feederLineId,
    this.sourceSubstationId,
    this.destinationSubstationId,
    this.feederLineCode,
    this.feederlineName,
  });

  factory FeederLine.fromJson(Map<String, dynamic> json) {
    return FeederLine(
      feederLineId: json['feederLineId'] as int?,
      sourceSubstationId: json['sourceSubstationId'] as int?,
      destinationSubstationId: json['destinationSubstationId'] as int?,
      feederLineCode: json['feederLineCode'] as String?,
      feederlineName: json['feederlineName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'feederLineId': feederLineId,
      'sourceSubstationId': sourceSubstationId,
      'destinationSubstationId': destinationSubstationId,
      'feederLineCode': feederLineCode,
      'feederlineName': feederlineName,
    };
  }
}

