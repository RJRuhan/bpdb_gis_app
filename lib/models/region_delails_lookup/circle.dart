class Circle {
  int? circleId;
  String? circleCode;
  int? zoneId;
  String? zoneInfo;
  String? circleName;
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

  Circle({
    this.circleId,
    this.circleCode,
    this.zoneId,
    this.zoneInfo,
    this.circleName,
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

  factory Circle.fromJson(Map<String, dynamic> json) {
    return Circle(
      circleId: json['circleId'],
      circleCode: json['circleCode'],
      zoneId: json['zoneId'],
      zoneInfo: json['zoneInfo'],
      circleName: json['circleName'],
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
      'circleId': circleId,
      'circleCode': circleCode,
      'zoneId': zoneId,
      'zoneInfo': zoneInfo,
      'circleName': circleName,
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
