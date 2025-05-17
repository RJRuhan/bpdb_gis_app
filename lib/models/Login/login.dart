class Login {
  final String Username;
  final String Password;

  Login({required this.Username, required this.Password});

  Map<String, dynamic> toJson() => {
        "Username": Username,
        "Password": Password,
      };
}

class LoginResponse {
  final String token;
  final User user;

  LoginResponse({required this.token, required this.user});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['Token'],
      user: User.fromJson(json['User']),
    );
  }
}

class User {
  final int? ZoneId;
  final int? CircleId;
  final int? SndId;
  final int? EsuId;
  final String? UserName;
  final String? Email;
  final String? GroupName;
  late final int? GroupId;
  final String? PhoneNumber;
  final String? BpdbEmpDesignation;

  User({
    this.ZoneId,
    this.CircleId,
    this.SndId,
    this.EsuId,
    this.UserName,
    this.Email,
    this.GroupName,
    this.GroupId,
    this.PhoneNumber,
    this.BpdbEmpDesignation,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      ZoneId: json['ZoneId'],
      CircleId: json['CircleId'],
      SndId: json['SndId'],
      EsuId: json['EsuId'],
      UserName: json['UserName'],
      Email: json['Email'],
      GroupName: json['GroupName'],
      GroupId: json['GroupId'],
      PhoneNumber: json['PhoneNumber'],
      BpdbEmpDesignation: json['BpdbEmpDesignation'],
    );
  }
}