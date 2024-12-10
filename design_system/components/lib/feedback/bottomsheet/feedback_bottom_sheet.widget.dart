import 'package:commons_core/animation/custom_animation.dart';
import 'package:design_system_components/button/button.props.dart';
import 'package:design_system_components/button/button.widget.dart';
import 'package:design_system_components/feedback/bottomsheet/feedback_bottom_sheet.dart';
import 'package:design_system_components/text/text.props.dart';
import 'package:design_system_components/text/text.widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DSFeedbackBottomSheetWidget extends StatefulWidget {
  DSFeedbackBottomSheetWidget({
    super.key,
    required String title,
    required String description,
    DSFeedbackBottomSheetType type = DSFeedbackBottomSheetType.fatalError,
    String? buttonText,
    void Function()? onButtonPressed,
  }) : props = DSFeedbackBottomSheetProps(
      title: title,
      description: description,
      type: type,
      buttonText: buttonText,
      onButtonPressed: onButtonPressed);

  @override
  State<DSFeedbackBottomSheetWidget> createState() => _DSFeedbackBottomSheetWidget();

  final DSFeedbackBottomSheetProps props;
}

class _DSFeedbackBottomSheetWidget extends State<DSFeedbackBottomSheetWidget> with TickerProviderStateMixin{

  late final AnimationController _controller;
  final _style = DSFeedbackBottomSheetStyle();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: _style.token.spacing.sm),
              child: SizedBox(
                child: Lottie.asset(
                  _style.getAnimationByType(widget.props.type),
                  decoder: customDecoder,
                  controller: _controller,
                  height: (widget.props.type == DSFeedbackBottomSheetType.fatalError) ?   200 : 70,
                  fit: BoxFit.fill,
                  onLoaded: (composition) {
                    _controller..duration = composition.duration
                      ..forward()
                      ..repeat();
                  },
                ),
              ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: (widget.props.type == DSFeedbackBottomSheetType.fatalError) ? 0 :_style.token.spacing.xs,
                left: _style.token.spacing.xs,
                right: _style.token.spacing.xs
            ),
            child: DSTextWidget(
                text: widget.props.title,
                typographyColor: _style.token.color.onSurfaceHigh,
                typographyStyle: DSTypographyStyleType.t20Medium
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: _style.token.spacing.xxxs,
                left: _style.token.spacing.xs,
                right: _style.token.spacing.xs,
                bottom:_style.token.spacing.xxs
            ),
            child: DSTextWidget(
                textAlign: TextAlign.start,
                text: widget.props.description,
                typographyColor: _style.token.color.onSurfaceHigh,
                typographyStyle: DSTypographyStyleType.t14Regular
            ),
          ),

          SizedBox(
              width: double.infinity,
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: _style.token.spacing.xs,
                      horizontal: _style.token.spacing.xs
                  ),
                  child: DSButtonWidget(
                      text: widget.props.buttonText,
                      onPressed: () => {
                        widget.props.onButtonPressed?.call()
                      },
                      type: DSButtonType.primary
                  )
              )
          ),
        ]);
  }
}
