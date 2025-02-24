import 'dart:convert';

class SigninReqParams {
  final String email;
  final String password;

  SigninReqParams({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory SigninReqParams.fromMap(Map<String,dynamic> map) {
    return SigninReqParams(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());
  factory SigninReqParams.fromJson(String source) => SigninReqParams.fromMap(json.decode(source));
}

