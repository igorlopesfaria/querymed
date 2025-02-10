import 'package:design_system_components/progress/screen/progress_screen.dart';

class DSProgressScreenProps {
  DSProgressScreenProps({
    required this.text,
    required this.callbackInitProgress,
    required this.callbackFinishProgress,
    required this.callbackStopProgress
  });

  final String text;
  final void Function(DSProgressScreenCallback) callbackInitProgress;
  final void Function() callbackFinishProgress;
  final void Function() callbackStopProgress;

}