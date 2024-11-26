import 'package:equatable/equatable.dart';

abstract class ForceUpdateState extends Equatable {}

class ForceUpdateInitState extends ForceUpdateState {
  @override
  List<Object?> get props => [];
}
