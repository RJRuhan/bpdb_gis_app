class Substation {
  final int substationId;
  final int sndId;
  final String substationCode;
  final String substationName;

  Substation({
    required this.substationId,
    required this.sndId,
    required this.substationCode,
    required this.substationName,
  });

  factory Substation.fromJson(Map<String, dynamic> json) {
    return Substation(
      substationId: json['substationId'],
      sndId: json['sndId'],
      substationCode: json['substationCode'],
      substationName: json['substationName'],
    );
  }
}
