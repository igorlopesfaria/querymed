import 'package:design_system_components/progress/bar/progress_bar.dart';
import 'package:design_system_components/progress/screen/progress_screen.dart';
import 'package:design_system_components/text/text.props.dart';
import 'package:design_system_components/text/text.widget.dart';
import 'package:design_system_core/token/ds_tokens_provider.dart';
import 'package:flutter/material.dart';

class DSProgressScreenWidget extends StatefulWidget  {

  DSProgressScreenWidget({
    super.key,
    required String text,
    required Function(DSProgressScreenCallback) callbackInitProgress,
    required void Function() callbackFinishProgress,
  required void Function() callbackStopProgress
}) : props = DSProgressScreenProps(
      text: text,
      callbackInitProgress: callbackInitProgress,
      callbackFinishProgress: callbackFinishProgress,
      callbackStopProgress: callbackStopProgress
  );

  final DSProgressScreenProps props;


  @override
  State createState() => _DSProgressScreenWidgetState();

}

class _DSProgressScreenWidgetState
    extends State<DSProgressScreenWidget>implements DSProgressScreenCallback {
  @override
  void initState() {
    super.initState();
    initProgress();
  }

  double currentProgress = 0;

  void setCurrentPageProgress(double progress) {
    setState(() {
      currentProgress = progress;
    });
  }

  void initProgress() async {
    for (var i = 0; i <= 33; i++) {
      await Future.delayed(const Duration(milliseconds: 10), () {});
      setCurrentPageProgress(double.parse(i.toString()));
    }
    widget.props.callbackInitProgress(this);
  }

  @override
  void finishProgress() async {
    for (var i = 33; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 3), () {});
      setCurrentPageProgress(double.parse(i.toString()));
    }
    await Future.delayed(const Duration(milliseconds: 900), () {});
    widget.props.callbackFinishProgress();
  }

  @override
  void stopProgress() async {
    for (var i = 33; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 3), () {});
      setCurrentPageProgress(double.parse(i.toString()));
    }
    await Future.delayed(const Duration(milliseconds: 900), () {});
    widget.props.callbackStopProgress();
  }


  @override
  Widget build(BuildContext context) {
    final token = DSTokenProvider().provide();

    return Scaffold(
        backgroundColor: token.color.primary,
        body: PopScope(
            canPop: false,
            child: SafeArea(
                child: Column(mainAxisSize: MainAxisSize.max, children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: token.spacing.sm),
                            child: DSProgressBarWidget(
                              max: 100,
                              current: currentProgress,
                              backgroundType: DSProgressBarBackgroundType.dark,
                              indicatorType: DSProgressBarIndicatorType.primary,
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.all(token.spacing.sm),
                              child: DSTextWidget(
                                text: widget.props.text,
                                typographyStyle:
                                    DSTypographyStyleType.t12Regular,
                                textAlign: TextAlign.left,
                                typographyColor: token.color.white,
                              ))
                        ]),
                  ),
            ]))));
  }



}
