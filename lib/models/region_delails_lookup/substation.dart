class Substations {
  int? substationId;
  int? zoneId;
  String? zoneInfo;
  int? circleId;
  String? circleInfo;
  int? sndId;
  String? sndInfo;
  int? esuId;
  String? esuInfo;
  String? substationName;
  String? substationCode;
  int? sndDetailTypeId;
  String? sndDetailType;
  int? substationTypeId;
  String? substationType;
  String? nominalVoltage;
  String? installedCapacity;
  double? maximumDemand;
  double? peakLoad;
  String? location;
  String? areaOfSubstation;
  double? latitude;
  double? longitude;
  int? defaultZoomLevel;
  String? yearOfComissioning;
  DateTime? startingDate;
  DateTime? endingDate;
  int? activationStatusId;
  String? dataActivationStatus;
  int? verificationStateId;
  String? dataVerificationState;
  String? remarks;
  bool? isPermittedToVerify;
  bool? isPermittedToApprove;
  bool? isEditAvailable;
  Capacity? totalCapacity;

  Substations({
    this.substationId,
    this.zoneId,
    this.zoneInfo,
    this.circleId,
    this.circleInfo,
    this.sndId,
    this.sndInfo,
    this.esuId,
    this.esuInfo,
    this.substationName,
    this.substationCode,
    this.sndDetailTypeId,
    this.sndDetailType,
    this.substationTypeId,
    this.substationType,
    this.nominalVoltage,
    this.installedCapacity,
    this.maximumDemand,
    this.peakLoad,
    this.location,
    this.areaOfSubstation,
    this.latitude,
    this.longitude,
    this.defaultZoomLevel,
    this.yearOfComissioning,
    this.startingDate,
    this.endingDate,
    this.activationStatusId,
    this.dataActivationStatus,
    this.verificationStateId,
    this.dataVerificationState,
    this.remarks,
    this.isPermittedToVerify,
    this.isPermittedToApprove,
    this.isEditAvailable,
    this.totalCapacity,
  });

  factory Substations.fromJson(Map<String, dynamic> json) {
    return Substations(
      substationId: json['substationId'],
      zoneId: json['zoneId'],
      zoneInfo: json['zoneInfo'],
      circleId: json['circleId'],
      circleInfo: json['circleInfo'],
      sndId: json['sndId'],
      sndInfo: json['sndInfo'],
      esuId: json['esuId'],
      esuInfo: json['esuInfo'],
      substationName: json['substationName'],
      substationCode: json['substationCode'],
      sndDetailTypeId: json['sndDetailTypeId'],
      sndDetailType: json['sndDetailType'],
      substationTypeId: json['substationTypeId'],
      substationType: json['substationType'],
      nominalVoltage: json['nominalVoltage'],
      installedCapacity: json['installedCapacity'],
      maximumDemand: (json['maximumDemand'] as num?)?.toDouble(),
      peakLoad: (json['peakLoad'] as num?)?.toDouble(),
      location: json['location'],
      areaOfSubstation: json['areaOfSubstation'],
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      defaultZoomLevel: json['defaultZoomLevel'],
      yearOfComissioning: json['yearOfComissioning'],
      startingDate: json['startingDate'] != null ? DateTime.parse(json['startingDate']) : null,
      endingDate: json['endingDate'] != null ? DateTime.parse(json['endingDate']) : null,
      activationStatusId: json['activationStatusId'],
      dataActivationStatus: json['dataActivationStatus'],
      verificationStateId: json['verificationStateId'],
      dataVerificationState: json['dataVerificationState'],
      remarks: json['remarks'],
      isPermittedToVerify: json['isPermittedToVerify'],
      isPermittedToApprove: json['isPermittedToApprove'],
      isEditAvailable: json['isEditAvailable'],
      totalCapacity: json['totalCapacity'] != null ? Capacity.fromJson(json['totalCapacity']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'substationId': substationId,
      'zoneId': zoneId,
      'zoneInfo': zoneInfo,
      'circleId': circleId,
      'circleInfo': circleInfo,
      'sndId': sndId,
      'sndInfo': sndInfo,
      'esuId': esuId,
      'esuInfo': esuInfo,
      'substationName': substationName,
      'substationCode': substationCode,
      'sndDetailTypeId': sndDetailTypeId,
      'sndDetailType': sndDetailType,
      'substationTypeId': substationTypeId,
      'substationType': substationType,
      'nominalVoltage': nominalVoltage,
      'installedCapacity': installedCapacity,
      'maximumDemand': maximumDemand,
      'peakLoad': peakLoad,
      'location': location,
      'areaOfSubstation': areaOfSubstation,
      'latitude': latitude,
      'longitude': longitude,
      'defaultZoomLevel': defaultZoomLevel,
      'yearOfComissioning': yearOfComissioning,
      'startingDate': startingDate?.toIso8601String(),
      'endingDate': endingDate?.toIso8601String(),
      'activationStatusId': activationStatusId,
      'dataActivationStatus': dataActivationStatus,
      'verificationStateId': verificationStateId,
      'dataVerificationState': dataVerificationState,
      'remarks': remarks,
      'isPermittedToVerify': isPermittedToVerify,
      'isPermittedToApprove': isPermittedToApprove,
      'isEditAvailable': isEditAvailable,
      'totalCapacity': totalCapacity?.toJson(),
    };
  }
}

class Capacity {
  double? min;
  double? max;

  Capacity({this.min, this.max});

  factory Capacity.fromJson(Map<String, dynamic> json) {
    return Capacity(
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'min': min,
      'max': max,
    };
  }
}
