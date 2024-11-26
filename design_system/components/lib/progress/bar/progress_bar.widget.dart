import 'package:design_system_components/progress/bar/progress_bar.dart';
import 'package:flutter/cupertino.dart';

class DSProgressBarWidget extends StatelessWidget {
  DSProgressBarWidget({
    super.key,
    required double max,
    required double current,
    DSProgressBarBackgroundType backgroundType = DSProgressBarBackgroundType.light,
    DSProgressBarIndicatorType indicatorType = DSProgressBarIndicatorType.secondary,
  }) : props = DSProgressBarProps(max: max, current: current, backgroundType: backgroundType, indicatorType: indicatorType);

  final DSProgressBarProps props;

  @override
  Widget build(BuildContext context) {
    final style = DSProgressBarStyle();
    return LayoutBuilder(
      builder: (_, boxConstraints) {
        var x = boxConstraints.maxWidth;
        var percent = (props.current / props.max) * x;
        return Stack(
          children: [
            Container(
              width: x,
              height: 4,
              decoration: BoxDecoration(
                color: style.getBackgroundColor(props.backgroundType),
                borderRadius: BorderRadius.circular(style.getRadius()),
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: style.animationTime),
              width: percent,
              height: 4,
              decoration: BoxDecoration(
                color: style.getIndicatorColor(props.indicatorType),
                borderRadius: BorderRadius.circular(style.getRadius()),
              ),
            ),
          ],
        );
      },
    );
  }

}
