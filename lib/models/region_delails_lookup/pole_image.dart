class PoleImage {
  final int poleId;
  final int pictureId;
  final String? pictureName;
  final String? componentTypeName;
  final String? subComponentTypeName;

  PoleImage({
    required this.poleId,
    required this.pictureId,
    this.pictureName,
    this.componentTypeName,
    this.subComponentTypeName,
  });

  factory PoleImage.fromJson(Map<String, dynamic> json) {
    return PoleImage(
      poleId: json['poleId'],
      pictureId: json['pictureId'],
      pictureName: json['pictureName'],
      componentTypeName: json['componentTypeName'],
      subComponentTypeName: json['subComponentTypeName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'poleId': poleId,
      'pictureId': pictureId,
      'pictureName': pictureName,
      'componentTypeName': componentTypeName,
      'subComponentTypeName': subComponentTypeName,
    };
  }
}