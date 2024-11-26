import 'package:design_system_components/snackbar/snackbar.dart';
import 'package:design_system_components/text/text.props.dart';
import 'package:design_system_components/text/text.widget.dart';
import 'package:flutter/material.dart';

class DSSnackBarWidget {
  DSSnackBarWidget();

  static show(BuildContext context,  String text, DSSnackBarType type) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        content: DSTextWidget(
          text: text,
          typographyStyle: DSTypographyStyleType.t12Medium,
          typographyColor: DSSnackBarStyle.getTextColorByType(type),
        ),
        backgroundColor: DSSnackBarStyle.getBackgroundColorByType(type),
        behavior: SnackBarBehavior.floating
      ),
    );
  }
}
