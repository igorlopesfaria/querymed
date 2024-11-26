import 'package:design_system_components/text/text.props.dart';
import 'package:design_system_components/text/text.style.dart';
import 'package:flutter/widgets.dart';

class DSTextWidget extends StatelessWidget {
  DSTextWidget({
    super.key,
    required String text,
    required DSTypographyStyleType typographyStyle,
    required Color typographyColor,
    int? maxLines,
    TextAlign textAlign = TextAlign.left,
    TextDecoration decoration = TextDecoration.none,
    TextOverflow overflow =  TextOverflow.visible
  }) : props = DSTextProps (
      text: text,
      typographyStyle: typographyStyle,
      typographyColor: typographyColor,
      textAlign: textAlign,
      maxLines: maxLines,
      decoration: decoration,
      overflow: overflow
  );

  final DSTextProps props;
  final textStyle = DSTextStyle();

  @override
  Widget build(BuildContext context) {

    return Text(
      props.text,
      textAlign: props.textAlign,
      maxLines: props.maxLines,
      overflow: props.overflow,
      style: textStyle
          .customTextStyle(props.typographyStyle)
          .copyWith(
            decoration: props.decoration,
            color: props.typographyColor
          ),
    );
  }
}
