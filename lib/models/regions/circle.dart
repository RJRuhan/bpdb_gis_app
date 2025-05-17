class Circles {
  final int circleId;
  final int zoneId;
  final String circleCode;
  final String circleName;
  final double centerLatitude;
  final double centerLongitude;
  final int defaultZoomLevel;

  Circles({
    required this.circleId,
    required this.zoneId,
    required this.circleCode,
    required this.circleName,
    required this.centerLatitude,
    required this.centerLongitude,
    required this.defaultZoomLevel,
  });

  factory Circles.fromJson(Map<String, dynamic> json) {
    return Circles(
      circleId: json['circleId'],
      zoneId: json['zoneId'],
      circleCode: json['circleCode'],
      circleName: json['circleName'],
      centerLatitude: (json['centerLatitude'] ?? 0.0).toDouble(), // Handle null with default 0.0
      centerLongitude: (json['centerLongitude'] ?? 0.0).toDouble(), // Handle null with default 0.0
      defaultZoomLevel: json['defaultZoomLevel'] ?? 0, // Handle null with default 0
    );
  }
}
