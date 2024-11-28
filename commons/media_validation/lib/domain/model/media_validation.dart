import 'package:equatable/equatable.dart';

class MediaValidation extends Equatable{

  const MediaValidation({
    required this.resource,
    required this.media,
    required this.token
  });

  final String resource;
  final String media;
  final String token;

  @override
  List<Object> get props => [resource, media, token];

}