class DistributionTransformer {
  final int id;
  final String distributionTransformerCode;
  final int poleDetailsLeftId;
  final int poleDetailsRightId;

  DistributionTransformer({
    required this.id,
    required this.distributionTransformerCode,
    required this.poleDetailsLeftId,
    required this.poleDetailsRightId,
  });

  factory DistributionTransformer.fromJson(Map<String, dynamic> json) {
    return DistributionTransformer(
      id: json['id'],
      distributionTransformerCode: json['distributionTransformerCode'],
      poleDetailsLeftId: json['poleDetailsLeftId'],
      poleDetailsRightId: json['poleDetailsRightId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'distributionTransformerCode': distributionTransformerCode,
      'poleDetailsLeftId': poleDetailsLeftId,
      'poleDetailsRightId': poleDetailsRightId,
    };
  }
}
