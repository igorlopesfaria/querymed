import 'package:design_system_components/progress/step/progress_step.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DSProgressStepWidget extends StatefulWidget {
  final int currentPage;
  final int totalPages;

  DSProgressStepWidget({
    super.key,
    required this.currentPage,
    required this.totalPages
  }) : props = DSProgressStepProps(
      currentPage: currentPage,
      totalPages: totalPages
  );
  final DSProgressStepProps props;

  @override
  State<DSProgressStepWidget> createState() => _DSProgressStepWidget();
}

class _DSProgressStepWidget extends State<DSProgressStepWidget> {

  final style = DSProgressStepStyle();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildLines(),
    );

  }

  List<Widget> _buildLines() {

    List<Widget> lines = [];

    for (int i = 0; i < widget.props.totalPages; i++) {
      Color lineColor = widget.props.currentPage > i ? style.getActiveStepColor() : style.getInactiveStepColor();
      lines.add(Flexible(
        child: Container(
          height: widget.props.currentPage > i ? style.getActiveStepHeight(): style.getInactiveStepHeight(),
          width: style.getStepWidth(),// Adjust the height of the lines as needed
          decoration: BoxDecoration(
            color:lineColor,
            borderRadius: BorderRadius.circular(10), // Adjust the border radius as needed
          ),
        ),
      ));
      if (i != widget.props.totalPages - 1) {
        lines.add(SizedBox(
            width: style.getStepSpaceBetween())
        ); // Add spacing between lines
      }
    }
    return lines;
  }
}