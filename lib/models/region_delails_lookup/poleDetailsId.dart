class PoleDetails {
  final int poleDetailsId;
  final String poleCode;
  final int poleId;
  final int zoneId;
  final int circleId;
  final int sndId;
  final int? esuId;
  final int substationId;
  final int feederLineId;
  final String zoneName;
  final String circleName;
  final String snDName;
  final String? esuName;
  final String substationName;
  final String feederlineName;
  final int feederWiseSerialNo;
  final String poleNo;
  final String previousPoleNo;
  final int lineTypeId;
  final String lineTypeName;
  final double? backSpan;
  final int typeOfWireId;
  final String name;
  final double? wireLength;
  final int wireConditionId;
  final String phaseAId;
  final String phaseBId;
  final String phaseCId;
  final bool neutral;
  final String poleUniqueCode;
  final bool isRightPole;

  PoleDetails({
    required this.poleDetailsId,
    required this.poleCode,
    required this.poleId,
    required this.zoneId,
    required this.circleId,
    required this.sndId,
    this.esuId,
    required this.substationId,
    required this.feederLineId,
    required this.zoneName,
    required this.circleName,
    required this.snDName,
    this.esuName,
    required this.substationName,
    required this.feederlineName,
    required this.feederWiseSerialNo,
    required this.poleNo,
    required this.previousPoleNo,
    required this.lineTypeId,
    required this.lineTypeName,
    this.backSpan,
    required this.typeOfWireId,
    required this.name,
    this.wireLength,
    required this.wireConditionId,
    required this.phaseAId,
    required this.phaseBId,
    required this.phaseCId,
    required this.neutral,
    required this.poleUniqueCode,
    required this.isRightPole,
  });

  factory PoleDetails.fromJson(Map<String, dynamic> json) {
    return PoleDetails(
      poleDetailsId: json['poleDetailsId'],
      poleCode: json['poleCode'],
      poleId: json['poleId'],
      zoneId: json['zoneId'],
      circleId: json['circleId'],
      sndId: json['sndId'],
      esuId: json['esuId'],
      substationId: json['substationId'],
      feederLineId: json['feederLineId'],
      zoneName: json['zoneName'],
      circleName: json['circleName'],
      snDName: json['snDName'],
      esuName: json['esuName'],
      substationName: json['substationName'],
      feederlineName: json['feederlineName'],
      feederWiseSerialNo: json['feederWiseSerialNo'],
      poleNo: json['poleNo'],
      previousPoleNo: json['previousPoleNo'],
      lineTypeId: json['lineTypeId'],
      lineTypeName: json['lineTypeName'],
      backSpan: json['backSpan'],
      typeOfWireId: json['typeOfWireId'],
      name: json['name'],
      wireLength: json['wireLength'],
      wireConditionId: json['wireConditionId'],
      phaseAId: json['phaseAId'],
      phaseBId: json['phaseBId'],
      phaseCId: json['phaseCId'],
      neutral: json['neutral'],
      poleUniqueCode: json['poleUniqueCode'],
      isRightPole: json['isRightPole'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'poleDetailsId': poleDetailsId,
      'poleCode': poleCode,
      'poleId': poleId,
      'zoneId': zoneId,
      'circleId': circleId,
      'sndId': sndId,
      'esuId': esuId,
      'substationId': substationId,
      'feederLineId': feederLineId,
      'zoneName': zoneName,
      'circleName': circleName,
      'snDName': snDName,
      'esuName': esuName,
      'substationName': substationName,
      'feederlineName': feederlineName,
      'feederWiseSerialNo': feederWiseSerialNo,
      'poleNo': poleNo,
      'previousPoleNo': previousPoleNo,
      'lineTypeId': lineTypeId,
      'lineTypeName': lineTypeName,
      'backSpan': backSpan,
      'typeOfWireId': typeOfWireId,
      'name': name,
      'wireLength': wireLength,
      'wireConditionId': wireConditionId,
      'phaseAId': phaseAId,
      'phaseBId': phaseBId,
      'phaseCId': phaseCId,
      'neutral': neutral,
      'poleUniqueCode': poleUniqueCode,
      'isRightPole': isRightPole,
    };
  }
}
