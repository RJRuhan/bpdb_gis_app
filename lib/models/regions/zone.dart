// class Zone {
//   final int zoneId;
//   final String zoneCode;
//   final String zoneName;
//   final double centerLatitude;
//   final double centerLongitude;
//   final int defaultZoomLevel;

//   Zone({
//     required this.zoneId,
//     required this.zoneCode,
//     required this.zoneName,
//     required this.centerLatitude,
//     required this.centerLongitude,
//     required this.defaultZoomLevel,
//   });

//   factory Zone.fromJson(Map<String, dynamic> json) {
//     return Zone(
//       zoneId: json['zoneId'],
//       zoneCode: json['zoneCode'],
//       zoneName: json['zoneName'],
//       centerLatitude: json['centerLatitude'],
//       centerLongitude: json['centerLongitude'],
//       defaultZoomLevel: json['defaultZoomLevel'],
//     );
//   }
// }


class Zone {
  final int zoneId;
  final String zoneCode;
  final String zoneName;
  final double centerLatitude;
  final double centerLongitude;
  final int defaultZoomLevel;

  Zone({
    required this.zoneId,
    required this.zoneCode,
    required this.zoneName,
    required this.centerLatitude,
    required this.centerLongitude,
    required this.defaultZoomLevel,
  });

  factory Zone.fromJson(Map<String, dynamic> json) {
    return Zone(
      zoneId: json['zoneId'] ?? 0, // Handle null with default value
      zoneCode: json['zoneCode'] ?? '', // Handle null with empty string
      zoneName: json['zoneName'] ?? '', // Handle null with empty string
      centerLatitude: (json['centerLatitude'] ?? 0.0).toDouble(), // Handle null with default 0.0
      centerLongitude: (json['centerLongitude'] ?? 0.0).toDouble(), // Handle null with default 0.0
      defaultZoomLevel: json['defaultZoomLevel'] ?? 0, // Handle null with default 0
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'zoneId': zoneId,
      'zoneCode': zoneCode,
      'zoneName': zoneName,
      'centerLatitude': centerLatitude,
      'centerLongitude': centerLongitude,
      'defaultZoomLevel': defaultZoomLevel,
    };
  }
}

