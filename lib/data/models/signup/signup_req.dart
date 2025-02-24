import 'dart:convert';

class SignupReqParams {
  final String username;
  final String email;
  final String phone;
  final String password;

  SignupReqParams({
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
  });

  Map<String,dynamic> toMap() {
    return<String,dynamic> {
      'username': username,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }

  factory SignupReqParams.fromMap(Map<String,dynamic> map) {
    return SignupReqParams(
      username: map['username'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());
  factory SignupReqParams.fromJson(String source) => SignupReqParams.fromMap(json.decode(source));
}

