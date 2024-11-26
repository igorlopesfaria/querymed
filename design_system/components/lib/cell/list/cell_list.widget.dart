
import 'package:design_system_components/cell/list/cell_list.dart';
import 'package:design_system_components/text/text.dart';
import 'package:flutter/material.dart';

class DSCellListWidget extends StatelessWidget {
  DSCellListWidget({
    super.key,
    required String title,
    String? description,
    String? imagePath,
    IconData? icon,
    IconData? iconRight,
    void Function()? onPressed})
      : props = DSCellListProps(
          title: title,
          description: description,
          imagePath: imagePath,
          iconLeft: icon,
          iconRight: iconRight,
          onPressed: onPressed,
        );

  final DSCellListProps props;
  final DSCellListStyle style = DSCellListStyle();

  @override
  Widget build(BuildContext context) {

    return InkWell(
        onTap: props.onPressed != null ? () {
          props.onPressed?.call();
        } : null,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: style.token.spacing.xs,
              horizontal: style.token.spacing.xs),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Visibility(
                  visible: props.iconLeft != null,
                  child: Icon(
                    size: 24,
                    props.iconLeft,
                    color: style.token.color.onSurfaceHigh,
                  )),
              Visibility(visible: props.imagePath != null,
                  child: Image(
                    image: AssetImage(
                      props.imagePath ??"",
                    ),
                  )),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: (props.iconLeft != null || props.imagePath != null) ? style.token.spacing.xxs: style.token.spacing.xxxs
                          ),
                          child: DSTextWidget(
                              text: props.title,
                              textAlign: TextAlign.left,
                              typographyColor: style.token.color.onSurfaceHigh,
                              typographyStyle:
                                  DSTypographyStyleType.t14Regular),
                        ),
                    Visibility(
                        visible: (props.description != null),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:  (props.iconLeft != null || props.imagePath != null) ? style.token.spacing.xxs : style.token.spacing.xxxs),
                          child: DSTextWidget(
                              text: props.description??"",
                              textAlign: TextAlign.left,
                              typographyColor: style.token.color.onSurfaceMedium,
                              typographyStyle:
                                  DSTypographyStyleType.t12Regular),
                        )),
                  ],
                ),
              ),
              Visibility(
                visible: props.onPressed != null,
                child: Flexible(
                  flex: 0,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: props.iconRight == null
                        ? Icon(size: 16, Icons.keyboard_arrow_right, color: style.token.color.onSurfaceHigh,)
                        : Icon(size: 24, props.iconRight, color: style.token.color.onSurfaceHigh,),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
