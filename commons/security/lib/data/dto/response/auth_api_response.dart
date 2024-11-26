import 'package:equatable/equatable.dart';

class AuthApiResponse extends Equatable {
  const AuthApiResponse({
    required this.id,
    required this.token,
  });

  final String id;
  final AuthTokenApiResponse token;

  factory AuthApiResponse.fromJson(Map<String, dynamic> json) =>
      AuthApiResponse(
        id: json["id"],
        token: AuthTokenApiResponse.fromJson(json["token"])
      );

  @override
  List<Object> get props => [id, token];
}

class AuthTokenApiResponse extends Equatable {
  const AuthTokenApiResponse({
    required this.stRefreshToken,
    required this.stAccessToken,
  });

  final String stRefreshToken;
  final String stAccessToken;

  factory AuthTokenApiResponse.fromJson(Map<String, dynamic> json) =>
      AuthTokenApiResponse(
          stRefreshToken: json["stRefreshToken"],
          stAccessToken: json["stAccessToken"]
      );

  @override
  List<Object> get props => [stRefreshToken, stAccessToken];
}
