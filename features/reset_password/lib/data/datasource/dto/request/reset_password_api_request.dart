import 'package:equatable/equatable.dart';

class ResetPasswordApiRequest extends Equatable{
  const ResetPasswordApiRequest({
    required this.newPassword,
    required this.token
  });

  final String newPassword;
  final String token;

  Map<String, dynamic> toJson() => {
        'newPassword': newPassword,
        'token' : token
  };

  @override
  List<Object?> get props => [newPassword, token];

}