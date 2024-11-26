import 'package:equatable/equatable.dart';

class AuthLocalDB extends Equatable {
  const AuthLocalDB({
    required this.id,
    required this.token
  });

  final String id;
  final AuthTokenLocalDB token;

  Map<String, dynamic> toJson() => {
    'id': id,
    'token': token.toJson(),
  };

  factory AuthLocalDB.fromJson(Map<String, dynamic> json) => AuthLocalDB(
        id: json["id"],
        token: AuthTokenLocalDB.fromJson(json["token"])
      );

  @override
  List<Object> get props => [id, token];
}

class AuthTokenLocalDB extends Equatable {
  const AuthTokenLocalDB({
    required this.stRefreshToken,
    required this.stAccessToken,
  });

  final String stRefreshToken;
  final String stAccessToken;

  Map<String, dynamic> toJson() => {
    'stRefreshToken': stRefreshToken,
    'stAccessToken': stAccessToken,
  };

  factory AuthTokenLocalDB.fromJson(Map<String, dynamic> json) => AuthTokenLocalDB(
    stRefreshToken: json["stRefreshToken"],
    stAccessToken: json["stAccessToken"],
  );

  @override
  List<Object> get props => [stRefreshToken, stAccessToken];
}

