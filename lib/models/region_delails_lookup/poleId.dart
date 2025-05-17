class PoleDetailByID {
  final int poleId;
  final int poleTypeId;
  final String poleTypeName;
  final int poleConditionId;
  final String conditionName;
  final DateTime surveyDate;
  final String surveyorName;
  final double latitude;
  final double longitude;
  final int? noOfWireHt;
  final int? noOfWireLt;
  final String msjNo;
  final String sleeveNo;
  final String twistNo;
  final bool streetLight;
  final bool transformerExist;
  final bool commonPole;
  final bool tap;
  final String? poleNumber;
  final double? poleHeight;
  final int? noOfLine11Kv;
  final int? noOfLineP4Kv;
  final int? noOfLine33Kv;

  PoleDetailByID({
    required this.poleId,
    required this.poleTypeId,
    required this.poleTypeName,
    required this.poleConditionId,
    required this.conditionName,
    required this.surveyDate,
    required this.surveyorName,
    required this.latitude,
    required this.longitude,
    this.noOfWireHt,
    this.noOfWireLt,
    required this.msjNo,
    required this.sleeveNo,
    required this.twistNo,
    required this.streetLight,
    required this.transformerExist,
    required this.commonPole,
    required this.tap,
    this.poleNumber,
    this.poleHeight,
    this.noOfLine11Kv,
    this.noOfLineP4Kv,
    this.noOfLine33Kv,
  });

  // factory PoleDetailByID.fromJson(Map<String, dynamic> json) {
  //   return PoleDetailByID(
  //     poleId: json['poleId'],
  //     poleTypeId: json['poleTypeId'],
  //     poleTypeName: json['poleTypeName'],
  //     poleConditionId: json['poleConditionId'],
  //     conditionName: json['conditionName'],
  //     surveyDate: DateTime.parse(json['surveyDate']),
  //     surveyorName: json['surveyorName'],
  //     latitude: json['latitude'],
  //     longitude: json['longitude'],
  //     noOfWireHt: json['noOfWireHt'],
  //     noOfWireLt: json['noOfWireLt'],
  //     msjNo: json['msjNo'],
  //     sleeveNo: json['sleeveNo'],
  //     twistNo: json['twistNo'],
  //     streetLight: json['streetLight'],
  //     transformerExist: json['transformerExist'],
  //     commonPole: json['commonPole'],
  //     tap: json['tap'],
  //     poleNumber: json['poleNumber'],
  //     poleHeight: json['poleHeight'],
  //     noOfLine11Kv: json['noOfLine11Kv'],
  //     noOfLineP4Kv: json['noOfLineP4Kv'],
  //     noOfLine33Kv: json['noOfLine33Kv'],
  //   );
  // }
  factory PoleDetailByID.fromJson(Map<String, dynamic> json) {
    return PoleDetailByID(
      poleId: json['poleId'] as int,
      poleTypeId: json['poleTypeId'] as int,
      poleTypeName: json['poleTypeName'] as String,
      poleConditionId: json['poleConditionId'] as int,
      conditionName: json['conditionName'] as String,
      surveyDate: json['surveyDate'] != null
          ? DateTime.parse(json['surveyDate'] as String)
          : DateTime.now(), // Default to current date if null
      surveyorName: json['surveyorName'] as String? ?? '',
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
      noOfWireHt: json['noOfWireHt'] as int?,
      noOfWireLt: json['noOfWireLt'] as int?,
      msjNo: json['msjNo'] as String? ?? '',
      sleeveNo: json['sleeveNo'] as String? ?? '',
      twistNo: json['twistNo'] as String? ?? '',
      streetLight: json['streetLight'] as bool? ?? false,
      transformerExist: json['transformerExist'] as bool? ?? false,
      commonPole: json['commonPole'] as bool? ?? false,
      tap: json['tap'] as bool? ?? false,
      poleNumber: json['poleNumber'] as String?,
      poleHeight: json['poleHeight'] as double?,
      noOfLine11Kv: json['noOfLine11Kv'] as int?,
      noOfLineP4Kv: json['noOfLineP4Kv'] as int?,
      noOfLine33Kv: json['noOfLine33Kv'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'poleId': poleId,
      'poleTypeId': poleTypeId,
      'poleTypeName': poleTypeName,
      'poleConditionId': poleConditionId,
      'conditionName': conditionName,
      'surveyDate': surveyDate.toIso8601String(),
      'surveyorName': surveyorName,
      'latitude': latitude,
      'longitude': longitude,
      'noOfWireHt': noOfWireHt,
      'noOfWireLt': noOfWireLt,
      'msjNo': msjNo,
      'sleeveNo': sleeveNo,
      'twistNo': twistNo,
      'streetLight': streetLight,
      'transformerExist': transformerExist,
      'commonPole': commonPole,
      'tap': tap,
      'poleNumber': poleNumber,
      'poleHeight': poleHeight,
      'noOfLine11Kv': noOfLine11Kv,
      'noOfLineP4Kv': noOfLineP4Kv,
      'noOfLine33Kv': noOfLine33Kv,
    };
  }
}
