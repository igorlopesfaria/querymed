import 'package:equatable/equatable.dart';

class MediaValidationApiResponse extends Equatable {
  const MediaValidationApiResponse({
    required this.resource,
    required this.media,
    required this.token
  });

  final String resource;
  final String media;
  final String token;

  factory MediaValidationApiResponse.fromJson(Map<String, dynamic> json) =>
      MediaValidationApiResponse(
          resource: json["resource"],
          media: json["media"],
          token: json["token"]
      );

  @override
  List<Object> get props => [resource, media, token];
}
