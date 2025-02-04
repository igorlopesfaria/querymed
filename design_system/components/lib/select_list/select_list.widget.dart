import 'package:design_system_components/cell/list/cell_list.dart';
import 'package:design_system_components/select_list/select_list.dart';
import 'package:design_system_components/text/text.dart';
import 'package:flutter/material.dart';

class DSSelectListWidget extends StatelessWidget {
  DSSelectListWidget(
      {super.key,
      required String hint,
      String? text,
      String? imagePathLeft,
      IconData? iconLeft,
      IconData? iconRight,
      void Function()? onPressed})
      : _props = DSSelectListProps(
          hint: hint,
          text: text,
          imagePathLeft: imagePathLeft,
          iconLeft: iconLeft,
          iconRight: iconRight,
          onPressed: onPressed,
        );

  final DSSelectListProps _props;
  final DSSelectListStyle _style = DSSelectListStyle();

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          _props.onPressed?.call();
        },
        child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: BorderSide(color: _style.token.color.primary, width: 1),
            ),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: _style.token.color.white,
                  borderRadius: BorderRadius.circular(4)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: _style.token.spacing.xs),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Visibility(
                        visible: _props.iconLeft != null,
                        child: Icon(
                          size: 24,
                          _props.iconLeft,
                          color: _style.token.color.onSurfaceHigh,
                        )),
                    Visibility(
                        visible: _props.imagePathLeft != null,
                        child: Image(
                          width: 24,
                          height: 24,
                          image: NetworkImage(
                            _props.imagePathLeft ?? "",
                          ),
                        )),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerLeft,// Align text vertically
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: (_props.iconLeft != null || _props.imagePathLeft != null)
                            ? _style.token.spacing.xxs
                            : _style.token.spacing.xxxs,
                      ),
                      child: DSTextWidget(
                        text: _props.text ?? _props.hint,
                        textAlign: TextAlign.left,
                        typographyColor: _props.text != null ? _style.token.color.onSurfaceHigh : _style.token.color.onSurfaceLow,
                        typographyStyle: DSTypographyStyleType.t14Regular,
                      ),
                    ),
                  ),
                ),

                    Visibility(
                      visible: _props.onPressed != null,
                      child: Flexible(
                        flex: 0,
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: _props.iconRight == null
                              ? Icon(
                                  size: 16,
                                  Icons.keyboard_arrow_down,
                                  color: _style.token.color.onSurfaceHigh,
                                )
                              : Icon(
                                  size: 24,
                                  _props.iconRight,
                                  color: _style.token.color.onSurfaceHigh,
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
