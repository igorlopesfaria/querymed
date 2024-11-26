import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:design_system_components/slide_indicator/slide_indicator.props.dart';
import 'package:design_system_components/slide_indicator/slide_indicator.style.dart';

class DSSlideIndicatorWidget extends StatefulWidget {
  final int currentPage;
  final int totalPages;

  DSSlideIndicatorWidget({
    super.key,
    required this.currentPage,
    required this.totalPages
  }) : props = DSSlideIndicatorProps(
      currentPage: currentPage,
      totalPages: totalPages
  );
  final DSSlideIndicatorProps props;

  @override
  State<DSSlideIndicatorWidget> createState() => _DSSlideIndicatorWidget();
}

class _DSSlideIndicatorWidget extends State<DSSlideIndicatorWidget> {

  final style = DSSlideIndicatorStyle();

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
      Color lineColor = widget.props.currentPage == i ? style.getActiveStepColor() : style.getInactiveStepColor();
      lines.add(Flexible(
        child: Container(
          height: style.getStepHeight(),
          width: style.getStepWidth(),// Adjust the height of the lines as needed
          decoration: BoxDecoration(
            color:lineColor,
            borderRadius: BorderRadius.circular(2), // Adjust the border radius as needed
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