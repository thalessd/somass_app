import 'dart:convert';

class EnterResponse {
  final String token;
  final String fullName;
  final List<String> escorts;

  EnterResponse({this.token, this.fullName, this.escorts});

  factory EnterResponse.fromJson(Map<String, dynamic> json) {
    return EnterResponse(
        token: json['token'] as String,
        fullName: json['fullName'] as String,
        escorts: json['escorts'] != null ? json['escorts'].cast<String>() ?? [] : []
    );
  }
}
