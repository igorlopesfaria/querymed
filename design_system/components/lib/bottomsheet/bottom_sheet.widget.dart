import 'package:design_system_components/bottomsheet/bottom_sheet.dart';
import 'package:design_system_components/bottomsheet/bottom_sheet.style.dart';
import 'package:design_system_core/token/ds_tokens_provider.dart';
import 'package:flutter/material.dart';

class DSBottomSheetWidget extends StatelessWidget {
  DSBottomSheetWidget({
    super.key,
    required bool showDragIcon,
    required Widget child,
  }) : props = DSBottomSheetProps(
      child: child,
      showDragIcon: showDragIcon
  );
  final DSBottomSheetProps props;

  @override
  Widget build(BuildContext context) {
    final style = DSBottomSheetStyle();
    return SafeArea(child: Wrap(
      children: [
        Column(
          children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center, children:[
            Padding(
                padding:
                EdgeInsets.symmetric(vertical: style.token.spacing.xs),
                child: Visibility(visible: props.showDragIcon,  child: Icon(
                  Icons.drag_handle,
                  color: style.token.color.surfaceOutlineHigh,
                ))),

          ]),
            Padding(
                padding: const EdgeInsets.only(
                  top: 0,
                  bottom: 0,
                ),
                child: props.child),
          ],
        ),
      ],
    ));
  }
}

void showDSBottomSheet({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
  bool? isDismissible,
  bool? enableDrag,
  Clip? clipBehavior,
  BoxConstraints? constraints,
  Color? barrierColor,
  bool isScrollControlled = false,
  bool useRootNavigator = false,
  RouteSettings? routeSettings,
  AnimationController? transitionAnimationController,
  Offset? anchorPoint,
  bool hasLogoIcon = false,
}) {
  final style = DSBottomSheetStyle();

  showModalBottomSheet(
    clipBehavior: clipBehavior,
    constraints: constraints,
    barrierColor: barrierColor,
    isScrollControlled: true,
    useRootNavigator: useRootNavigator,
    isDismissible: isDismissible ?? true,
    enableDrag: enableDrag ?? true,
    routeSettings: routeSettings,
    elevation: style.elevation,
    shape: style.shape,
    context: context,
    transitionAnimationController: transitionAnimationController,
    anchorPoint: anchorPoint,
    builder: (_) {
      return   Container(
          decoration:  BoxDecoration(
          color: DSTokenProvider().provide().color.surface, // Set your desired color here
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
      ),
      child: PopScope(
          canPop: (enableDrag == true || isDismissible == true),
          child: DSBottomSheetWidget(
            showDragIcon: !(enableDrag == false),
            child: builder(context),
          )
      ));
    },
  );
}
