class Esu {
  int? esuId;
  String? esuCode;
  int? zoneId;
  String? zoneInfo;
  int? circleId;
  String? circleInfo;
  int? sndId;
  String? sndInfo;
  String? esuName;
  double? centerLatitude;
  double? centerLongitude;
  int? defaultZoomLevel;
  DateTime? startingDate;
  DateTime? endingDate;
  int? activationStatusId;
  String? dataActivationStatus;
  int? verificationStateId;
  String? dataVerificationState;
  String? officeInfo;

  Esu({
    this.esuId,
    this.esuCode,
    this.zoneId,
    this.zoneInfo,
    this.circleId,
    this.circleInfo,
    this.sndId,
    this.sndInfo,
    this.esuName,
    this.centerLatitude,
    this.centerLongitude,
    this.defaultZoomLevel,
    this.startingDate,
    this.endingDate,
    this.activationStatusId,
    this.dataActivationStatus,
    this.verificationStateId,
    this.dataVerificationState,
    this.officeInfo,
  });

  factory Esu.fromJson(Map<String, dynamic> json) {
    return Esu(
      esuId: json['esuId'],
      esuCode: json['esuCode'],
      zoneId: json['zoneId'],
      zoneInfo: json['zoneInfo'],
      circleId: json['circleId'],
      circleInfo: json['circleInfo'],
      sndId: json['sndId'],
      sndInfo: json['sndInfo'],
      esuName: json['esuName'],
      centerLatitude: (json['centerLatitude'] as num?)?.toDouble(),
      centerLongitude: (json['centerLongitude'] as num?)?.toDouble(),
      defaultZoomLevel: json['defaultZoomLevel'],
      startingDate: json['startingDate'] != null ? DateTime.parse(json['startingDate']) : null,
      endingDate: json['endingDate'] != null ? DateTime.parse(json['endingDate']) : null,
      activationStatusId: json['activationStatusId'],
      dataActivationStatus: json['dataActivationStatus'],
      verificationStateId: json['verificationStateId'],
      dataVerificationState: json['dataVerificationState'],
      officeInfo: json['officeInfo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'esuId': esuId,
      'esuCode': esuCode,
      'zoneId': zoneId,
      'zoneInfo': zoneInfo,
      'circleId': circleId,
      'circleInfo': circleInfo,
      'sndId': sndId,
      'sndInfo': sndInfo,
      'esuName': esuName,
      'centerLatitude': centerLatitude,
      'centerLongitude': centerLongitude,
      'defaultZoomLevel': defaultZoomLevel,
      'startingDate': startingDate?.toIso8601String(),
      'endingDate': endingDate?.toIso8601String(),
      'activationStatusId': activationStatusId,
      'dataActivationStatus': dataActivationStatus,
      'verificationStateId': verificationStateId,
      'dataVerificationState': dataVerificationState,
      'officeInfo': officeInfo,
    };
  }
}
