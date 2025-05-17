class FeederLineType {
  int feederLineTypeId;
  String feederLineTypeName;

  FeederLineType({
    required this.feederLineTypeId,
    required this.feederLineTypeName,
  });

  factory FeederLineType.fromJson(Map<String, dynamic> json) {
    return FeederLineType(
      feederLineTypeId: json['feederLineTypeId'],
      feederLineTypeName: json['feederLineTypeName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'feederLineTypeId': feederLineTypeId,
      'feederLineTypeName': feederLineTypeName,
    };
  }
}