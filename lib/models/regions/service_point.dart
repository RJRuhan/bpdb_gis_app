// class ServicePoint {
//   final int servicesPointId;
//   final String servicePointCode;
//   final int poleDetailsId;

//   ServicePoint({
//     required this.servicesPointId,
//     required this.servicePointCode,
//     required this.poleDetailsId,
//   });

//   factory ServicePoint.fromJson(Map<String, dynamic> json) {
//     return ServicePoint(
//       servicesPointId: json['servicesPointId'],
//       servicePointCode: json['servicePointCode'],
//       poleDetailsId: json['poleDetailsId'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'servicesPointId': servicesPointId,
//       'servicePointCode': servicePointCode,
//       'poleDetailsId': poleDetailsId,
//     };
//   }
// }


class ServicePoint {
  final int servicesPointId;
  final String servicePointCode;
  final int poleDetailsId;

  ServicePoint({
    required this.servicesPointId,
    required this.servicePointCode,
    required this.poleDetailsId,
  });

  factory ServicePoint.fromJson(Map<String, dynamic> json) {
    return ServicePoint(
      servicesPointId: json['servicesPointId'] ?? 0, // default value if null
      servicePointCode: json['servicePointCode'] ?? '', // default value if null
      poleDetailsId: json['poleDetailsId'] ?? 0, // default value if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'servicesPointId': servicesPointId ?? 0, // ensure non-null value
      'servicePointCode': servicePointCode ?? '',
      'poleDetailsId': poleDetailsId ?? 0,
    };
  }
}
