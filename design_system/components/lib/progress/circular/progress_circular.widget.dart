import 'package:design_system_components/progress/circular/progress_circular.props.dart';
import 'package:design_system_components/progress/circular/progress_circular.style.dart';
import 'package:flutter/material.dart';

class DSProgressCircularWidget extends StatelessWidget {
  DSProgressCircularWidget({
    super.key,
    required double size,
    required double strokeWidth,
    required Color color,
  }) : props = DSProgressCircularProps(strokeWidth: strokeWidth, color: color, size: size);

  final DSProgressCircularProps props;
  final style = DSProgressCircularStyle();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: props.size,
        width: props.size,
        child: CircularProgressIndicator(
          strokeWidth: props.strokeWidth,
          color: props.color,
        )
    );
  }
}
