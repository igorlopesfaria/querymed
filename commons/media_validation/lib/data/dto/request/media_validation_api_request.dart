import 'package:equatable/equatable.dart';

class MediaValidationApiRequest extends Equatable {
  const MediaValidationApiRequest({
    required this.resource,
    required this.media,
  });

  final String resource;
  final String media;

  Map<String, dynamic> toJson() => {
    'resource': resource,
    'media': media
  };

  @override
  List<Object> get props => [resource, media];
}

