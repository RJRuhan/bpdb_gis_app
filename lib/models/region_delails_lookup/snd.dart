class Snd {
  int? sndId;
  String? sndCode;
  int? zoneId;
  String? zoneInfo;
  int? circleId;
  String? circleInfo;
  String? snDName;
  int? sndTypeId;
  String? sndType;
  String? locationCode;
  String? districtGeoCode;
  String? adminBndDistrict;
  int? isInCity;
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

  Snd({
    this.sndId,
    this.sndCode,
    this.zoneId,
    this.zoneInfo,
    this.circleId,
    this.circleInfo,
    this.snDName,
    this.sndTypeId,
    this.sndType,
    this.locationCode,
    this.districtGeoCode,
    this.adminBndDistrict,
    this.isInCity,
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

  factory Snd.fromJson(Map<String, dynamic> json) {
    return Snd(
      sndId: json['sndId'],
      sndCode: json['sndCode'],
      zoneId: json['zoneId'],
      zoneInfo: json['zoneInfo'],
      circleId: json['circleId'],
      circleInfo: json['circleInfo'],
      snDName: json['snDName'],
      sndTypeId: json['sndTypeId'],
      sndType: json['sndType'],
      locationCode: json['locationCode'],
      districtGeoCode: json['districtGeoCode'],
      adminBndDistrict: json['adminBndDistrict'],
      isInCity: json['isInCity'],
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
      'sndId': sndId,
      'sndCode': sndCode,
      'zoneId': zoneId,
      'zoneInfo': zoneInfo,
      'circleId': circleId,
      'circleInfo': circleInfo,
      'snDName': snDName,
      'sndTypeId': sndTypeId,
      'sndType': sndType,
      'locationCode': locationCode,
      'districtGeoCode': districtGeoCode,
      'adminBndDistrict': adminBndDistrict,
      'isInCity': isInCity,
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
