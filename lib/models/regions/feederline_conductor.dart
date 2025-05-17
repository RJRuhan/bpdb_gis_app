class FeederConductorType {
  int feederConductorTypeId;
  String feederConductorTypeName;

  FeederConductorType({
    required this.feederConductorTypeId,
    required this.feederConductorTypeName,
  });

  factory FeederConductorType.fromJson(Map<String, dynamic> json) {
    return FeederConductorType(
      feederConductorTypeId: json['feederConductorTypeId'],
      feederConductorTypeName: json['feederConductorTypeName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'feederConductorTypeId': feederConductorTypeId,
      'feederConductorTypeName': feederConductorTypeName,
    };
  }
}
