import 'package:equatable/equatable.dart';

class Auth extends Equatable {
  const Auth({required this.id, required this.token});

  final String id;
  final AuthToken token;

  @override
  List<Object> get props => [id, token];
}

class AuthToken extends Equatable {
  const AuthToken({required this.stRefreshToken, required this.stAccessToken});

  final String stRefreshToken;
  final String stAccessToken;

  @override
  List<Object> get props => [stRefreshToken, stAccessToken];
}
