import 'package:equatable/equatable.dart';

class AuthRefreshTokenApiRequest extends Equatable{
  const AuthRefreshTokenApiRequest({required this.stRefreshToken});

  final String stRefreshToken;

  Map<String, dynamic> toJson() => {
    'stRefreshToken': stRefreshToken,
  };

  @override
  List<Object> get props => [stRefreshToken];
}
